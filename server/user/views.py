from django.contrib.auth import authenticate, login as user_login, logout as user_logout
from django.http import JsonResponse
from django.views.decorators.http import require_http_methods
# from django.middleware.csrf import get_token


@require_http_methods(['GET'])
def index(request):
    """
    获取用户信息
    :param request:
    :return: JSON
    """
    # get_token(request)

    if request.user.is_authenticated:
        return JsonResponse({
            'id': request.user.id,
            'name': request.user.username
        })
    else:
        return JsonResponse({
            'error': '未登录'
        })


@require_http_methods(['POST'])
def login(request):
    """
    用户登录
    :param request: username, password
    :return: JSON
    """
    try:
        username = request.POST['username']
        password = request.POST['password']
    except KeyError as e:
        return JsonResponse({
            'error': '缺少键%s' % e
        })

    user = authenticate(username=username, password=password)
    if user is None:
        return JsonResponse({
            'error': '用户名或密码不正确'
        })
    user_login(request, user)

    return JsonResponse({
        'id': user.id,
        'name': user.username
    })


@require_http_methods(['POST'])
def logout(request):
    """
    用户注销
    :param request:
    :return:
    """
    user_logout(request)

    return JsonResponse({
        'msg': '注销成功'
    })