import json
import sys

from django.conf import settings
from django.core.exceptions import ObjectDoesNotExist
from django.http import JsonResponse, QueryDict
from django.views.decorators.http import require_http_methods

from .models import Blog as BlogModel

BLOG_PATH = settings.BASE_DIR + ('/db/blog_path/' if 'test' not in sys.argv else '/db/test_blog_path/')


@require_http_methods(['GET'])
def index(request):
    """
    获取所有博客或者指定博客
    不给参数: 随便推送一定数量的博客
    给定author: 获取该作者的所有博客
    给定author和path: 获取该作者的某一篇博客
    给定id：获取某一篇博客
    :param request: author, path, id
    :return: json
    """
    author = request.GET.get('author')
    path = request.GET.get('path')
    id = int(request.GET.get('id', 0))

    if author and path:
        # 获取指定博客
        # 检查路径节点数目是否正确
        node_names = path.split('/')
        if len(node_names) <= 1:
            return JsonResponse({
                'error': '路径不能为空，也不能为根目录'
            })
        # 根据作者名找到相应的JSON文件
        blog_path = BLOG_PATH + author + '.json'
        try:
            blog_file = open(blog_path, 'r')
            blog_json = json.load(blog_file)
            blog_file.close()
        except FileNotFoundError:
            return JsonResponse({
                'error': '不存在路径为%s的博客' % path
            })

        nodes = blog_json['nodes']
        parent = None
        for i in range(0, len(node_names)):
            if parent:
                break
            for node in nodes:
                if node['name'] == node_names[i]:
                    if i != len(node_names) - 1:
                        nodes = node['children']
                    else:
                        parent = node
                    break

        # 获得博客 id
        if not parent or 'id' not in parent:
            return JsonResponse({
                'error': '不存在路径为%s的博客' % path
            })
        blog_id = parent['id']

        # 查询数据库
        try:
            blog = BlogModel.objects.get(id=blog_id)
        except ObjectDoesNotExist:
            return JsonResponse({
                'error': '不存在该博客'
            })

        response = JsonResponse({
            'id': blog.id,
            'author': blog.author,
            'title': blog.title,
            'content': blog.content,
            'createdDate': blog.created_date,
            'viewsCount': blog.views_count
        })
    elif id:
        # 查询数据库
        try:
            blog = BlogModel.objects.get(id=id)
        except ObjectDoesNotExist:
            return JsonResponse({
                'error': '不存在id为%d博客' % id
            })

        response = JsonResponse({
            'id': blog.id,
            'author': blog.author,
            'title': blog.title,
            'content': blog.content,
            'createdDate': blog.created_date,
            'viewsCount': blog.views_count
        })
    elif author:
        # 获取该作者的所有博客
        pass
    else:
        # 随机推送一定数量的博客
        # TODO: 推送算法
        # 这里先实现为推送ID为前10的博客
        blogs_set = BlogModel.objects.all()[:10]
        blogs = [{
            'id': blog.id,
            'author': blog.author,
            'title': blog.title,
            'content': blog.content,
            'createdDate': blog.created_date,
            'viewsCount': blog.views_count
        } for blog in blogs_set]
        response = JsonResponse(blogs, safe=False)

    return response


@require_http_methods(['POST'])
def create(request):
    """
    创建博客
    :param request: author, title, content, path
    :return: json
    """
    try:
        author = request.POST['author']
        title = request.POST['title']
        content = request.POST['content']
        path = request.POST['path']
    except KeyError as e:
        return JsonResponse({
            'error': str(e)
        })

    # 检查路径节点数目是否正确
    node_names = path.split('/')
    if len(node_names) <= 1:
        return JsonResponse({
            'error': '路径不能为空，也不能为根目录'
        })

    # 根据作者名找到相应的JSON文件
    blog_path = BLOG_PATH + author + '.json'
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
        for node in nodes:
            if node['name'] == node_names[i]:
                if i != len(node_names) - 2:
                    nodes = node['children']
                else:
                    parent = node
                break

    # 未找到相应的父节点
    if not parent:
        return JsonResponse({
            'error': '没有%s路径'
        })

    # 将博客写入到数据库中
    blog = BlogModel.objects.create(author=author, title=title, content=content)

    # 将博客路径信息保存到相应的JSON文件中
    if 'children' in parent:
        parent['children'].append({'name': node_names[-1], 'id': blog.id})
    else:
        parent['children'] = [{'name': node_names[-1], 'id': blog.id}]
    blog_file = open(blog_path, 'w')
    json.dump(blog_json, blog_file)
    blog_file.close()

    return JsonResponse({
        'msg': '创建博客完成'
    })


@require_http_methods(['PUT'])
def rename(request):
    """
    重命名博客
    :param request: author, path, newName
    :return: json
    """
    put = QueryDict(request.body)
    try:
        author = put['author']
        path = put['path']
        new_name = put['newName']
    except KeyError as e:
        return JsonResponse({
            'error': str(e)
        })

    # 检查路径节点数目是否正确
    node_names = path.split('/')
    if len(node_names) <= 1:
        return JsonResponse({
            'error': '路径不能为空，也不能为根目录'
        })

    # 根据作者名找到相应的JSON文件
    blog_path = BLOG_PATH + author + '.json'
    try:
        blog_file = open(blog_path, 'r')
        blog_json = json.load(blog_file)
        blog_file.close()
    except FileNotFoundError:
        return JsonResponse({
            'error': '不存在路径为%s的文件' % path
        })

    nodes = blog_json['nodes']
    parent = None
    for i in range(0, len(node_names)):
        if parent:
            break
        for node in nodes:
            if node['name'] == node_names[i]:
                if i != len(node_names) - 1:
                    nodes = node['children']
                else:
                    parent = node
                break

    # 将博客路径信息保存到相应的JSON文件中
    if not parent:
        return JsonResponse({
            'error': '不存在路径为%s的文件' % path
        })
    else:
        parent['name'] = new_name
    blog_file = open(blog_path, 'w')
    json.dump(blog_json, blog_file)
    blog_file.close()

    return JsonResponse({
        'msg': '成功'
    })


@require_http_methods(['PUT'])
def save(request):
    """
    保存博客
    :param request: author, path | id, title, content
    :return: json
    """
    put = QueryDict(request.body)
    try:
        author = put['author']
        path = put.get('path')
        id = int(put.get('id', 0))
        title = put['title']
        content = put['content']
    except KeyError as e:
        return JsonResponse({
            'error': '不存在键%s' % str(e)
        })
    except ValueError as e:
        return JsonResponse({
            'error': 'id值必须为数字'
        })

    if id:
        blog_id = id
    elif path:
        # 检查路径节点数目是否正确
        node_names = path.split('/')
        if len(node_names) <= 1:
            return JsonResponse({
                'error': '路径不能为空，也不能为根目录'
            })

        # 根据作者名找到相应的JSON文件
        blog_path = BLOG_PATH + author + '.json'
        try:
            blog_file = open(blog_path, 'r')
            blog_json = json.load(blog_file)
            blog_file.close()
        except FileNotFoundError:
            return JsonResponse({
                'error': '不存在路径为%s的文件' % path
            })

        nodes = blog_json['nodes']
        parent = None
        for i in range(0, len(node_names)):
            if parent:
                break
            for node in nodes:
                if node['name'] == node_names[i]:
                    if i != len(node_names) - 1:
                        nodes = node['children']
                    else:
                        parent = node
                    break

        if not parent:
            return JsonResponse({
                'error': '不存在路径为%s的文件' % path
            })

        blog_id = parent['id']
    else:
        return JsonResponse({
            'error': '保存博客必须给定path或id'
        })

    blogs_set = BlogModel.objects.filter(id=blog_id)
    if blogs_set.exists():
        blogs_set.update(title=title, content=content)
    else:
        return JsonResponse({
            'error': '不存在id为%d的博客' % id if id else '不存在path为%s的博客' % path
        })

    return JsonResponse({
        'msg': '保存博客成功'
    })


@require_http_methods(['PUT'])
def incre_views_count(request):
    """
    递增博客阅览数
    :param request: id
    :return:
    """
    put = QueryDict(request.body)
    try:
        id = put['id']
    except KeyError as e:
        return JsonResponse({
            'error': '缺少键%s'
        })

    try:
        blog = BlogModel.objects.get(id=id)
    except ObjectDoesNotExist:
        return JsonResponse({
            'error': '不存在id为%d的博客' % id
        })
    blog.views_count += 1
    blog.save()
    return JsonResponse({
        'msg': '阅览量增加成功'
    })


@require_http_methods(['DELETE'])
def delete(request):
    """
    删除指定博客
    :param request: author, path
    :return: json
    """
    delete = QueryDict(request.body)
    try:
        author = delete['author']
        path = delete['path']
    except KeyError as e:
        return JsonResponse({
            'error': '缺少键%s' % str(e)
        })

    # 检查路径节点数目是否正确
    node_names = path.split('/')
    if len(node_names) <= 1:
        return JsonResponse({
            'error': '路径不能为空，也不能为根目录'
        })

    # 根据作者名找到相应的JSON文件
    blog_path = BLOG_PATH + author + '.json'
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
        for node in nodes:
            if node['name'] == node_names[i]:
                if i != len(node_names) - 2:
                    nodes = node['children']
                else:
                    parent = node
                break

    # 将博客路径信息保存到相应的JSON文件中
    if not parent or 'children' not in parent or len(parent['children']) == 0:
        return JsonResponse({
            'error': '不存在路径为%s的博客' % path
        })
    else:
        position = [pos for pos, node in enumerate(parent['children']) if node['name'] == node_names[-1]]
        if not position:
            return JsonResponse({
                'error': '不存在路径为%s的博客' % path
            })
    blog_info = parent['children'].pop(position[0])

    try:
        blog_id = blog_info['id']
    except KeyError:
        return JsonResponse({
            'error': '该路径下不存在博客'
        })

    try:
        BlogModel.objects.get(id=blog_id).delete()
    except ObjectDoesNotExist:
        return JsonResponse({
            'error': '数据不同步'
        })

    blog_file = open(blog_path, 'w')
    json.dump(blog_json, blog_file)
    blog_file.close()

    return JsonResponse({
        'msg': '删除博客完成'
    })


@require_http_methods(['GET'])
def dirs_index(request):
    """
    获取用户的目录信息
    :param request: author
    :return: json
    """
    try:
        author = request.GET['author']
    except KeyError as e:
        return JsonResponse({
            'error': str(e)
        })

    # 根据作者名找到相应的JSON文件
    blog_path = BLOG_PATH + author + '.json'
    try:
        blog_file = open(blog_path)
        blog_info = json.load(blog_file)
        blog_file.close()
    except FileNotFoundError:
        blog_file = open(blog_path, 'w')
        blog_info = {'nodes': []}
        json.dump(blog_info, blog_file)
        blog_file.close()

    return JsonResponse(blog_info['nodes'], safe=False)


@require_http_methods(['POST'])
def dirs_create(request):
    """
    创建目录
    :param request: author, path
    :return: json
    """
    try:
        author = request.POST['author']
        path = request.POST['path']
    except KeyError as e:
        return JsonResponse({
            'error': str(e)
        })

    # 根据作者名找到相应的JSON文件
    blog_path = BLOG_PATH + author + '.json'
    try:
        blog_file = open(blog_path, 'r')
        blog_json = json.load(blog_file)
        blog_file.close()
    except FileNotFoundError:
        blog_json = {"nodes": []}

    nodes = blog_json['nodes']
    node_names = path.split('/')
    parent = None
    for i in range(0, len(node_names) - 1):
        if parent:
            break
        for node in nodes:
            if node['name'] == node_names[i]:
                if i != len(node_names) - 2:
                    nodes = node['children']
                else:
                    parent = node
                break

    # 将博客路径信息保存到相应的JSON文件中
    if not parent:
        if len(node_names) == 1:
            nodes.append({'name': node_names[-1], 'children': []})
        else:
            return JsonResponse({
                'error': '不存在名为%s的路径' % path
            })
    elif 'children' in parent:
        parent['children'].append({'name': node_names[-1], 'children': []})
    else:
        parent['children'] = [{'name': node_names[-1], 'children': []}]
    blog_file = open(blog_path, 'w')
    json.dump(blog_json, blog_file)
    blog_file.close()

    return JsonResponse({
        'msg': '创建目录完成'
    })


@require_http_methods(['PUT'])
def dirs_rename(request):
    """
    重命名目录
    :param request: author, path, newName
    :return: json
    """
    put = QueryDict(request.body)
    try:
        author = put['author']
        path = put['path']
        new_name = put['newName']
    except KeyError as e:
        return JsonResponse({
            'error': str(e)
        })

    # 根据作者名找到相应的JSON文件
    blog_path = BLOG_PATH + author + '.json'
    blog_file = open(blog_path, 'r')
    blog_json = json.load(blog_file)
    blog_file.close()

    nodes = blog_json['nodes']
    node_names = path.split('/')
    parent = None
    for i in range(0, len(node_names)):
        if parent:
            break
        for node in nodes:
            if node['name'] == node_names[i]:
                if i != len(node_names) - 1:
                    nodes = node['children']
                else:
                    parent = node
                break

    # 将博客路径信息保存到相应的JSON文件中
    if not parent:
        return JsonResponse({
            'error': '没有路径为%s的目录' % path
        })
    else:
        parent['name'] = new_name
    blog_file = open(blog_path, 'w')
    json.dump(blog_json, blog_file)
    blog_file.close()

    return JsonResponse({
        'msg': '重命名目录完成'
    })


@require_http_methods(['DELETE'])
def dirs_delete(request):
    """
    删除指定目录
    :param request: author, path
    :return: json
    """
    delete = QueryDict(request.body)
    try:
        author = delete['author']
        path = delete['path']
    except KeyError as e:
        return JsonResponse({
            'error': str(e)
        })
    # 根据作者名找到相应的JSON文件
    blog_path = BLOG_PATH + author + '.json'
    try:
        blog_file = open(blog_path, 'r')
        blog_json = json.load(blog_file)
        blog_file.close()
    except FileNotFoundError:
        blog_json = {"nodes": []}

    nodes = blog_json['nodes']
    node_names = path.split('/')
    parent = None
    for i in range(0, len(node_names) - 1):
        if parent:
            break
        for node in nodes:
            if node['name'] == node_names[i]:
                if i != len(node_names) - 2:
                    nodes = node['children']
                else:
                    parent = node
                break

    # 将博客路径信息保存到相应的JSON文件中
    if not parent:
        if len(node_names) == 1 and node_names[0]:
            res = [pos for pos, node in enumerate(nodes) if node['name'] == node_names[-1]]
            if len(res) != 1:
                return JsonResponse({
                    'error': '不存在路径为%s的目录' % path
                })
            else:
                position = res[0]
                blogs_root = nodes.pop(position)
        else:
            return JsonResponse({
                'error': '不存在名为%s的路径' % path
            })
    else:
        if 'children' not in parent:
            return JsonResponse({
                'error': '不存在名为%s的路径' % path
            })
        else:
            res = [pos for pos, node in enumerate(parent['children'])
                        if node['name'] == node_names[-1] and 'id' not in node]
            if not res:
                return JsonResponse({
                    'error': '不存在路径名为%s的目录' % path
                })
            else:
                position = res[0]
                blogs_root = parent['children'].pop(position)

    blogs_nodes = [blogs_root]
    # 遍历即将删除的节点
    while blogs_nodes:
        blog_node = blogs_nodes.pop(0)
        if 'id' in blog_node:
            # 删除数据库中的节点信息
            try:
                BlogModel.objects.get(id=blog_node['id']).delete()
            except ObjectDoesNotExist:
                pass
        elif 'children' in blog_node:
            # 继续遍历子节点
            blogs_nodes.append([node for node in blog_node['children']])

    blog_file = open(blog_path, 'w')
    json.dump(blog_json, blog_file)
    blog_file.close()

    return JsonResponse({
        'msg': '删除目录完成'
    })