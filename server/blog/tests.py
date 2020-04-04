import json
from urllib import parse

from django.test import TestCase, Client
from django.urls import reverse
from django.contrib.auth.models import User

from .models import Category, Blog


class BlogTest(TestCase):
    client = Client()

    def setUp(self):
        # 向数据库中插入测试用的数据
        self.test_category1 = Category.objects.create(name='test_category1')
        self.test_blog1 = Blog.objects.create(category=self.test_category1, title='test_blog_title1', content='test_blog_content1')
        self.test_blog2 = Blog.objects.create(category=self.test_category1, title='test_blog_title2', content='test_blog_content2')
        self.test_blog3 = Blog.objects.create(category=self.test_category1, title='test_blog_title3', content='test_blog_content3')
        # 以超级管理员身份登录（部分测试必须要使用管理员权限）
        self.superuser = User.objects.create_superuser(username='superuser', password='password', email='123456@163.com')
        self.client.post(reverse('user:login'), parse.urlencode({
            'username': 'superuser',
            'password': 'password'
        }), content_type='application/x-www-form-urlencoded')

    def test_get_blog(self):
        """获取博客"""
        # Case 1: 根据id获取博客，测试已经存在的博客id
        response = self.client.get(reverse('blog:index'), {'id': self.test_blog1.id})
        blog = json.loads(response.content)
        # 检查返回的数据是否为字典，且是否包含title, content键
        self.assertIsInstance(blog, dict)
        [self.assertIn(_, blog) for _ in ['title', 'content']]

        # Case 2: 根据id获取博客，测试不存在的博客id
        response = self.client.get(reverse('blog:index'), {'id': 999999999})
        blog = json.loads(response.content)
        # 检查返回的数据是否为字典，且是否包含error键
        self.assertIsInstance(blog, dict)
        self.assertIn('error', blog)

        # Case 3: 根据categoryName和title获取博客，测试已存在的categoryName和title
        response = self.client.get(reverse('blog:index'), {
            'categoryName': self.test_category1.name,
            'title': self.test_blog1.title})
        blog = json.loads(response.content)
        self.assertNotIn('error', blog)

        # Case 4: 根据categoryName和title获取博客，测试已存在的categoryName和不存在的title
        response = self.client.get(reverse('blog:index'), {
            'categoryName': self.test_category1.name,
            'title': '999999999'})
        blog = json.loads(response.content)
        self.assertIn('error', blog)

        # Case 5: 根据categoryName和title获取博客，测试不存在的categoryName和不存在的title
        response = self.client.get(reverse('blog:index'), {
            'categoryName': '999999999',
            'title': '999999999'})
        blog = json.loads(response.content)
        self.assertIn('error', blog)

        # Case 6: 获取一些博客
        response = self.client.get(reverse('blog:index'))
        blogs = json.loads(response.content)
        self.assertIsInstance(blogs, list)
        for blog in blogs:
            self.assertIsInstance(blog, dict)
            [self.assertIn(_, blog) for _ in ['title', 'content']]

    def test_create_blog(self):
        """创建博客"""
        # Case 1: 根据categoryName和title和content创建博客
        title = 'test_title'
        content = 'test_content'
        response = self.client.post(reverse('blog:save'), parse.urlencode({
            'categoryName': self.test_category1.name,
            'title': title,
            'content': content
        }), content_type='application/x-www-form-urlencoded')

        data = json.loads(response.content)
        self.assertIsInstance(data, dict)
        self.assertNotIn('error', data)

        Blog.objects.get(category=self.test_category1, title=title, content=content)

    def test_update_blog(self):
        """保存博客"""
        # Case 1: 根据categoryName和title更新博客
        title = 'new title'
        content = 'new content'
        response = self.client.post(reverse('blog:save'), parse.urlencode({
            'categoryName': self.test_category1.name,
            'title': self.test_blog1.title,
            'content': content
        }), content_type='application/x-www-form-urlencoded')
        data = json.loads(response.content)
        self.assertNotIn('error', data)

        blog = Blog.objects.get(id=self.test_blog1.id)
        self.assertEqual(blog.content, content)

        # Case 2: 根据id更新博客
        response = self.client.post(reverse('blog:save'), parse.urlencode({
            'id': self.test_blog2.id,
            'content': content
        }), content_type='application/x-www-form-urlencoded')
        data = json.loads(response.content)
        self.assertNotIn('error', data)

        blog = Blog.objects.get(id=self.test_blog2.id)
        self.assertEqual(blog.content, content)

    def test_rename_blog(self):
        """重命名博客"""
        new_title = 'new name'
        # Case 1: 重命名不存在的博客(by catregoryName and title)
        response = self.client.put(reverse('blog:rename'), parse.urlencode({
            'categoryName': self.test_category1.name,
            'title': '999999999',
            'newTitle': new_title
        }), content_type='application/x-www-form-urlencoded')
        data = json.loads(response.content)
        self.assertIn('error', data)

        # Case 2: 重命名不存在的博客(by id)
        response = self.client.put(reverse('blog:rename'), parse.urlencode({
            'id': '999999999',
            'newTitle': new_title
        }), content_type='application/x-www-form-urlencoded')
        data = json.loads(response.content)
        self.assertIn('error', data)

        # Case 3: 重命名已存在的博客(by categoryName and title)
        response = self.client.put(reverse('blog:rename'), parse.urlencode({
            'categoryName': self.test_category1.name,
            'title': self.test_blog1.title,
            'newTitle': new_title
        }), content_type='application/x-www-form-urlencoded')
        data = json.loads(response.content)
        self.assertNotIn('error', data)

        blog = Blog.objects.get(id=self.test_blog1.id)
        self.assertEqual(blog.title, new_title)

        # Case 4: 重命名已存在的博客(by id)
        response = self.client.put(reverse('blog:rename'), parse.urlencode({
            'id': self.test_blog2.id,
            'newTitle': new_title
        }), content_type='application/x-www-form-urlencoded')
        data = json.loads(response.content)
        self.assertNotIn('error', data)

        blog = Blog.objects.get(id=self.test_blog2.id)
        self.assertEqual(blog.title, new_title)

    def test_get_categories(self):
        """获取分类"""
        # Case 1: 获取全部分类信息
        response = self.client.get(reverse('blog:categories_index'))
        data = json.loads(response.content)
        self.assertIsInstance(data, list)
        self.assertEqual(len(data), 1)
        self.assertIn(self.test_category1.name, data)

        # Case 2: 获取某一个分类下的所有博客信息
        response = self.client.get(reverse('blog:categories_index'), {'categoryName': self.test_category1.name})
        data = json.loads(response.content)
        self.assertIsInstance(data, list)
        self.assertEqual(len(data), 3)
        self.assertIn(self.test_blog1.title, data)
        self.assertIn(self.test_blog2.title, data)
        self.assertIn(self.test_blog3.title, data)

    def test_create_categories(self):
        """创建分类"""
        # Case 1: 创建分类
        category_name = 'new category'
        response = self.client.post(reverse('blog:categories_create'), {
            'categoryName': category_name
        })

        data = json.loads(response.content)
        self.assertNotIn('error', data)

        Category.objects.get(name=category_name)

    def test_rename_categories(self):
        """重命名分类"""
        # Case 1: 重命名分类
        new_category_name = 'new category name'
        response = self.client.put(reverse('blog:categories_rename'), parse.urlencode({
            'categoryName': self.test_category1.name,
            'newCategoryName': new_category_name
        }), content_type='application/x-www-form-urlencoded')

        data = json.loads(response.content)
        self.assertNotIn('error', data)

        category = Category.objects.get(name=new_category_name)

    def test_delete_categories(self):
        """删除分类"""
        # Case 1: 删除已存在的分类
        response = self.client.delete(reverse('blog:categories_delete'), parse.urlencode({
            'categoryName': self.test_category1.name
        }), content_type='application/x-www-form-urlencoded')

        data = json.loads(response.content)
        self.assertNotIn('error', data)

        try:
            Category.objects.get(id=self.test_category1.id)
            self.assertEqual(1, 2)
        except:
            pass

        try:
            Blog.objects.get(id=self.test_blog1.id)
            self.assertEqual(1, 2)
        except:
            pass

        try:
            Blog.objects.get(id=self.test_blog2.id)
            self.assertEqual(1, 2)
        except:
            pass

        try:
            Blog.objects.get(id=self.test_blog3.id)
            self.assertEqual(1, 2)
        except:
            pass

        # Case 2: 删除不存在的分类
        response = self.client.delete(reverse('blog:categories_delete'), parse.urlencode({
            'categoryName': '999999999'
        }), content_type='application/x-www-form-urlencoded')

        data = json.loads(response.content)
        self.assertIn('error', data)