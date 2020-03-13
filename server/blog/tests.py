import json
import os
from urllib import parse

from django.test import TestCase, Client
from django.urls import reverse
from django.conf import settings

from .models import Blog


BLOG_PATH = settings.BASE_DIR + '/db/test_blog_path/'


class BlogTest(TestCase):
    client = Client()

    def create_blog_path(self, author, path, id):
        blog_path = BLOG_PATH + author + '.json'
        node_names = path.split('/')

        try:
            blog_file = open(blog_path, 'r')
            blog_json = json.load(blog_file)
            blog_file.close()
        except FileNotFoundError:
            blog_json = {"nodes": []}

        nodes = blog_json['nodes']
        parent = None
        for i in range(0, len(node_names) - 1):
            if parent:
                break
            child_is_found = False
            for node in nodes:
                if node['name'] == node_names[i]:
                    child_is_found = True
                    if i != len(node_names) - 2:
                        nodes = node['children']
                    else:
                        parent = node
                    break
            if not child_is_found:
                nodes.append({
                    'name': node_names[i],
                    'children': []
                })
                if i != len(node_names) - 2:
                    nodes = nodes[-1]['children']
                else:
                    parent = nodes[-1]

        if 'children' in parent:
            parent['children'].append({'name': node_names[-1], 'id': id})
        else:
            parent['children'] = [{'name': node_names[-1], 'id': id}]

        blog_file = open(blog_path, 'w')
        json.dump(blog_json, blog_file)
        blog_file.close()

    def setUp(self):
        # 创建测试用的文件夹
        os.makedirs(BLOG_PATH, exist_ok=True)

        # 向数据库中插入测试用的数据
        self.test_blog1 = Blog.objects.create(author='狸', title='标题', content='```c\nint main\n{}\n```')
        self.test_blog1_path = 'dir1/blog1'
        self.create_blog_path('狸', self.test_blog1_path, self.test_blog1.id)
        self.test_blog2 = Blog.objects.create(author='吉', title='随便整的标题', content='> 随便整的内容')
        self.test_blog2_path = 'd1/b1'
        self.create_blog_path('吉', self.test_blog2_path, self.test_blog2.id)
        self.test_blog3 = Blog.objects.create(author='吧', title='Good title', content='## Bad content')
        self.test_blog3_path = 'd1/sd1/b2'
        self.create_blog_path('吧', self.test_blog3_path, self.test_blog3.id)

    def __del__(self):
        # 删除测试用的文件夹
        [os.remove(path) for path in os.scandir(BLOG_PATH)]
        os.removedirs(BLOG_PATH)

    def test_get_blog(self):
        """获取博客"""
        # Case 1: 根据id获取博客，测试已经存在的博客id
        response = self.client.get(reverse('blog:index'), {'id': self.test_blog1.id})
        blog = json.loads(response.content)
        # 检查返回的数据是否为字典，且是否包含author, title, content键
        self.assertIsInstance(blog, dict)
        [self.assertIn(_, blog) for _ in ['author', 'title', 'content']]

        # Case 2: 根据id获取博客，测试不存在的博客id
        response = self.client.get(reverse('blog:index'), {'id': 999999999})
        blog = json.loads(response.content)
        # 检查返回的数据是否为字典，且是否包含error键
        self.assertIsInstance(blog, dict)
        self.assertIn('error', blog)

        # Case 3: 根据author和path获取博客，测试已存在的author和path
        response = self.client.get(reverse('blog:index'), {
            'author': self.test_blog1.author,
            'path': self.test_blog1_path})
        blog = json.loads(response.content)
        self.assertNotIn('error', blog)

        # Case 4: 根据author和path获取博客，测试已存在的author和不存在的path
        response = self.client.get(reverse('blog:index'), {
            'author': self.test_blog1.author,
            'path': '999999999/999999999'})
        blog = json.loads(response.content)
        self.assertIn('error', blog)

        # Case 5: 根据author和path获取博客，测试不存在的author和不存在的path
        response = self.client.get(reverse('blog:index'), {
            'author': '999999999',
            'path': '999999999/999999999'})
        blog = json.loads(response.content)
        self.assertIn('error', blog)

        # Case 6: 获取所有博客
        response = self.client.get(reverse('blog:index'))
        blogs = json.loads(response.content)
        self.assertIsInstance(blogs, list)
        for blog in blogs:
            self.assertIsInstance(blog, dict)
            [self.assertIn(_, blog) for _ in ['author', 'title', 'content']]

    def test_create_blog(self):
        """创建博客"""
        # Case 1: 在非根目录创建博客
        response = self.client.post(reverse('blog:create'), parse.urlencode({
            'author': self.test_blog1.author,
            'path': self.test_blog1_path.split('/')[0] + '/' + 'blog2',
            'title': 'title',
            'content': 'content'
        }), content_type='application/x-www-form-urlencoded')

        data = json.loads(response.content)
        self.assertIsInstance(data, dict)
        self.assertNotIn('error', data)

        # Case 2: 在根目录创建博客
        response = self.client.post(reverse('blog:create'), parse.urlencode({
            'author': self.test_blog1.author,
            'path': self.test_blog1_path.split('/')[0] + 'blog2',
            'title': 'title',
            'content': 'content'
        }), content_type='application/x-www-form-urlencoded')

        data = json.loads(response.content)
        self.assertIsInstance(data, dict)
        self.assertIn('error', data)

    def test_save_blog(self):
        """保存博客"""
        # Case 1: 保存存在的博客
        response = self.client.put(reverse('blog:save'), parse.urlencode({
            'author': self.test_blog1.author,
            'path': self.test_blog1_path,
            'title': 'new title',
            'content': 'new content'
        }), content_type='application/x-www-form-urlencoded')
        data = json.loads(response.content)
        self.assertNotIn('error', data)

        blog_file = open(BLOG_PATH + self.test_blog1.author + '.json')
        blog_json = json.load(blog_file)
        blog_file.close()
        blog_id = blog_json['nodes'][0]['children'][0]['id']
        blog = Blog.objects.get(id=blog_id)
        self.assertEqual(blog.title, 'new title')
        self.assertEqual(blog.content, 'new content')

    def test_rename_blog(self):
        """重命名博客"""
        # Case 1: 重命名不存在的博客
        response = self.client.put(reverse('blog:rename'), parse.urlencode({
            'author': self.test_blog1.author,
            'path': 'dir1/999999999',
            'newName': 'new name'
        }), content_type='application/x-www-form-urlencoded')
        data = json.loads(response.content)
        self.assertIn('error', data)

        blog_file = open(BLOG_PATH + self.test_blog1.author + '.json')
        blog_json = json.load(blog_file)
        blog_file.close()
        self.assertEqual(blog_json['nodes'][0]['children'][0]['name'], self.test_blog1_path.split('/')[-1])

        # Case 2: 重命名已存在的博客
        response = self.client.put(reverse('blog:rename'), parse.urlencode({
            'author': self.test_blog1.author,
            'path': self.test_blog1_path,
            'newName': 'new name'
        }), content_type='application/x-www-form-urlencoded')
        data = json.loads(response.content)
        self.assertNotIn('error', data)

        blog_file = open(BLOG_PATH + self.test_blog1.author + '.json')
        blog_json = json.load(blog_file)
        blog_file.close()
        self.assertEqual(blog_json['nodes'][0]['children'][0]['name'], 'new name')

    def test_get_dirs(self):
        """获取目录"""
        # Case 1: 根据已存在的作者名获取目录
        response = self.client.get(reverse('blog:dirs_index'), {'author': self.test_blog1.author})
        data = json.loads(response.content)

        self.assertIsInstance(data, list)

        # Case 2: 根据不存在的作者名获取目录
        response = self.client.get(reverse('blog:dirs_index'), {'author': '99999999'})
        data = json.loads(response.content)

        self.assertIsInstance(data, list)
        self.assertListEqual(data, [])

    def test_create_dirs(self):
        """创建目录"""
        # Case 1: 创建根目录
        author = 'test_author'
        path = 'test_path'
        response = self.client.post(reverse('blog:dirs_create'), {
            'author': author,
            'path': path
        })

        data = json.loads(response.content)
        self.assertIsInstance(data, dict)
        self.assertNotIn('error', data)

        blog_file = open(BLOG_PATH + author + '.json')
        blog_json = json.load(blog_file)
        blog_file.close()
        self.assertDictEqual(blog_json, {
            'nodes': [{
                'name': path,
                'children': []
            }]
        })

        # Case 2: 创建非根目录
        author = 'test_author'
        path = 'test_path/test_sub_path'
        response = self.client.post(reverse('blog:dirs_create'), {
            'author': author,
            'path': path
        })

        data = json.loads(response.content)
        self.assertIsInstance(data, dict)
        self.assertNotIn('error', data)

        blog_file = open(BLOG_PATH + author + '.json')
        blog_json = json.load(blog_file)
        blog_file.close()
        self.assertDictEqual(blog_json, {
            'nodes': [{
                'name': path.split('/')[0],
                'children': [{
                    'name': path.split('/')[1],
                    'children': []
                }]
            }]
        })

    def test_rename_dirs(self):
        """重命名目录"""
        # Case 1: 重命名根目录
        new_name = 'new_test_path'
        response = self.client.put(reverse('blog:dirs_rename'), parse.urlencode({
            'author': self.test_blog1.author,
            'path': self.test_blog1_path.split('/')[0],
            'newName': new_name
        }), content_type='application/x-www-form-urlencoded')

        data = json.loads(response.content)
        self.assertIsInstance(data, dict)
        self.assertNotIn('error', data)

        blog_file = open(BLOG_PATH + self.test_blog1.author + '.json')
        blog_json = json.load(blog_file)
        blog_file.close()
        self.assertEqual(blog_json['nodes'][0]['name'], new_name)

        # Case 2: 重命名非根目录
        new_name = 'test_sub_path'
        response = self.client.put(reverse('blog:dirs_rename'), parse.urlencode({
            'author': self.test_blog3.author,
            'path': self.test_blog3_path.split('/')[0] + '/' + self.test_blog3_path.split('/')[1],
            'newName': new_name
        }), content_type='application/x-www-form-urlencoded')

        data = json.loads(response.content)
        self.assertIsInstance(data, dict)
        self.assertNotIn('error', data)

        blog_file = open(BLOG_PATH + self.test_blog3.author + '.json')
        blog_json = json.load(blog_file)
        blog_file.close()
        self.assertEqual(blog_json['nodes'][0]['children'][0]['name'], new_name)

    def test_delete_dirs(self):
        """删除指定目录"""
        # Case 1: 删除已存在的目录
        response = self.client.delete(reverse('blog:dirs_delete'), parse.urlencode({
            'author': self.test_blog1.author,
            'path': self.test_blog1_path.split('/')[0]
        }), content_type='application/x-www-form-urlencoded')

        data = json.loads(response.content)
        self.assertNotIn('error', data)

        blog_file = open(BLOG_PATH + self.test_blog1.author + '.json')
        blog_json = json.load(blog_file)
        blog_file.close()
        self.assertDictEqual(blog_json, {'nodes': []})

        # Case 2: 删除不存在的目录
        response = self.client.delete(reverse('blog:dirs_delete'), parse.urlencode({
            'author': self.test_blog1.author,
            'path': '999999999'
        }), content_type='application/x-www-form-urlencoded')

        data = json.loads(response.content)
        self.assertIn('error', data)