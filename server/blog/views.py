from django.http import JsonResponse
from django.views.decorators.http import require_GET, require_POST
from django.contrib.auth import login, logout, authenticate


@require_GET
def index(request):
    """
    Get blogs.
    """