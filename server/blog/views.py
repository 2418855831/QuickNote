import json

from django.conf import settings
from django.core.exceptions import ObjectDoesNotExist
from django.db import IntegrityError
from django.http import JsonResponse, QueryDict
from django.views.decorators.http import require_http_methods
from django.contrib.auth.decorators import login_required

from .models import Category, Blog


@require_http_methods(['GET'])
def index(request):
    """
    获取博客:
        1. 获取指定的博客
        2. 随机获取一些博客
    :param request: ([categoryName, title] | id)
    :return:
    """
    try:
        category_name = request.GET.get('categoryName')
        title = request.GET.get('title')
        id_ = request.GET.get('id')
        if id_:
            try:
                id_ = int(id_)
            except ValueError:
                return JsonResponse({'error': '博客ID必须为整型'})
    except KeyError as e:
        return JsonResponse({'error': '不存在名称为%s的键' % e})

    if id_:
        try:
            blog = Blog.objects.get(id=id_)
        except ObjectDoesNotExist:
            return JsonResponse({'error': '不存在ID为%d的博客' % id_})
        return JsonResponse({
            'id': blog.id,
            'title': blog.title,
            'content': blog.content
        })
    elif category_name and title:
        try:
            category = Category.objects.get(name=category_name)
        except ObjectDoesNotExist:
            return JsonResponse({'error': '不存在名为%s的分类' % category_name})
        try:
            blog = category.blogs.get(title=title)
        except ObjectDoesNotExist:
            return JsonResponse({'error': '不存在名为%s的博客' % title})
        return JsonResponse({
            'id': blog.id,
            'title': blog.title,
            'content': blog.content
        })
    else:
        blogs = Blog.objects.order_by('created_date')[:10]
        response = []
        for blog in blogs:
            response.append({
                'id': blog.id,
                'title': blog.title,
                'content': blog.content
            })
        return JsonResponse(response, safe=False)


@require_http_methods(['PUT'])
def rename(request):
    """
    重命名博客
    :param request: [categoryName, title] | id, newTitle
    :return:
    """
    put = QueryDict(request.body)
    try:
        category_name = put.get('categoryName')
        title = put.get('title')
        id_ = put.get('id')
        new_title = put['newTitle']
        if id_:
            try:
                id_ = int(id_)
            except ValueError:
                return JsonResponse({'error': '博客ID必须为整型'})
    except KeyError as e:
        return JsonResponse({'error': '不存在名为%s的键' % e})

    if id_:
        try:
            blog = Blog.objects.get(id=id_)
        except ObjectDoesNotExist:
            return JsonResponse({'error': '不存在ID为%d的博客' % id_})
        blog.title = new_title
        blog.save()
    elif category_name and title:
        try:
            category = Category.objects.get(name=category_name)
        except ObjectDoesNotExist:
            return JsonResponse({'error': '不存在名为%s的分类' % category_name})

        try:
            blog = category.blogs.get(title=title)
        except ObjectDoesNotExist:
            return JsonResponse({'error': '不存在名为%s的博客' % title})

        blog.title = new_title
        blog.save()
    else:
        return JsonResponse({'error': '缺少键[categoryName, title] | id'})

    return JsonResponse({'msg': '重命名博客成功'})


@require_http_methods(['POST'])
def save(request):
    """
    保存博客
    :param request: [categoryName, title] | id, content
    :return:
    """
    try:
        category_name = request.POST.get('categoryName')
        title = request.POST.get('title')
        id_ = request.POST.get('id')
        content = request.POST['content']
        if id_:
            try:
                id_ = int(id_)
            except ValueError:
                return JsonResponse({'error': '博客ID必须为整型'})
    except KeyError as e:
        return JsonResponse({'error': '不存在名为%s的键' % e})

    if id_:
        try:
            blog = Blog.objects.get(id=id_)
        except ObjectDoesNotExist:
            return JsonResponse({'error': '不存在ID为%d的博客' % id_})
        blog.content = content
        blog.save()
    elif category_name and title:
        try:
            category = Category.objects.get(name=category_name)
        except ObjectDoesNotExist:
            return JsonResponse({'error': '不存在名为%s的分类' % category_name})
        category.blogs.update_or_create(title=title, defaults={'title': title, 'content': content})
    else:
        return JsonResponse({'error': '缺少键[categoryName, title] | id'})

    return JsonResponse({'msg': '保存博客成功'})


@require_http_methods(['POST'])
def incre_views_count(request):
    """
    增加博客浏览量
    :param request: [categoryName, title] | id
    :return:
    """
    try:
        category_name = request.POST.get('categoryName')
        title = request.POST.get('title')
        id_ = request.POST.get('id')
        if id_:
            try:
                id_ = int(id_)
            except ValueError:
                return JsonResponse({'error': '博客ID必须为整型'})
    except KeyError as e:
        return JsonResponse({'error': '不存在名为%s的键' % e})

    if id_:
        try:
            blog = Blog.objects.get(id=id_)
        except ObjectDoesNotExist:
            return JsonResponse({'error': '不存在ID为%d的博客' % id_})
        blog.views_count += 1
        blog.save()
    elif category_name and title:
        try:
            category = Category.objects.get(name=category_name)
        except ObjectDoesNotExist:
            return JsonResponse({'error': '不存在名为%s的分类' % category_name})

        try:
            blog = category.blogs.get(title=title)
        except ObjectDoesNotExist:
            return JsonResponse({'error': '不存在名为%s的博客' % title})

        blog.views_count += 1
        blog.save()
    else:
        return JsonResponse({'error': '缺少键[categoryName, title] | id'})

    return JsonResponse({'msg': '增加博客浏览量成功'})


@require_http_methods(['DELETE'])
def delete(request):
    """
    删除博客
    :param request: [categoryName, title] | id
    :return:
    """
    delete = QueryDict(request.body)
    try:
        category_name = delete.get('categoryName')
        title = delete.get('title')
        id_ = delete.get('id')
        if id_:
            try:
                id_ = int(id_)
            except ValueError:
                return JsonResponse({'error': '博客ID必须为整型'})
    except KeyError as e:
        return JsonResponse({'error': '不存在名为%s的键' % e})

    if id_:
        try:
            blog = Blog.objects.get(id=id_)
            blog.delete()
        except ObjectDoesNotExist:
            return JsonResponse({'error': '不存在ID为%d的博客' % id_})

    elif category_name and title:
        try:
            category = Category.objects.get(name=category_name)
        except ObjectDoesNotExist:
            return JsonResponse({'error': '不存在名为%s的分类' % category_name})

        try:
            blog = category.blogs.get(title=title)
            blog.delete()
        except ObjectDoesNotExist:
            return JsonResponse({'error': '不存在名为%s的博客' % title})

    else:
        return JsonResponse({'error': '缺少键[categoryName, title] | id'})

    return JsonResponse({'msg': '删除博客成功'})


@require_http_methods(['GET'])
def categories_index(request):
    """
    获取分类信息：
        1. 获取某分类下的所有博客信息
        2. 获取所有分类信息
    :param request: (categoryName)
    :return:
    """
    category_name = request.GET.get('categoryName')

    if category_name:
        try:
            category = Category.objects.get(name=category_name)
        except ObjectDoesNotExist:
            return JsonResponse({'error': '不存在名为%s的分类' % category_name})
        return JsonResponse([blog.title for blog in category.blogs.all()], safe=False)
    else:
        categories = Category.objects.all()
        return JsonResponse([category.name for category in categories], safe=False)


@require_http_methods(['POST'])
def categories_create(request):
    """
    创建分类
    :param request: categoryName
    :return:
    """
    try:
        category_name = request.POST['categoryName']
    except KeyError as e:
        return JsonResponse({'error': '不存在名为%s的键' % e})

    try:
        Category.objects.create(name=category_name)
        return JsonResponse({'msg': '创建分类成功'})
    except IntegrityError:
        return JsonResponse({'error': '已存在名为%s的分类' % category_name})


@require_http_methods(['PUT'])
def categories_rename(request):
    """
    重命名分类
    :param request: categoryName, newCategoryName
    :return:
    """
    put = QueryDict(request.body)
    try:
        category_name = put['categoryName']
        new_category_name = put['newCategoryName']
    except KeyError as e:
        return JsonResponse({'error': '不存在名为%s的键' % e})

    try:
        category = Category.objects.get(name=category_name)
    except ObjectDoesNotExist:
        return JsonResponse({'error': '不存在名为%s的分类' % category_name})

    category.name = new_category_name
    category.save()

    return JsonResponse({'msg': '重命名分类成功'})


@require_http_methods(['DELETE'])
def categories_delete(request):
    """
    删除分类
    :param request: categoryName
    :return:
    """
    delete = QueryDict(request.body)
    try:
        category_name = delete['categoryName']
    except KeyError as e:
        return JsonResponse({'error': '不存在名为%s的键' % e})

    try:
        category = Category.objects.get(name=category_name)
    except ObjectDoesNotExist:
        return JsonResponse({'error': '不存在名为%s的分类' % category_name})

    category.delete()

    return JsonResponse({'msg': '删除分类成功'})