from django.urls import path
from blog import views


app_name = 'blog'

urlpatterns = [
    path('', views.index, name='index'),
    path('rename', views.rename, name='rename'),
    path('save', views.save, name='save'),
    path('incre-views-count', views.incre_views_count, name='incre_views_count'),
    path('delete', views.delete, name='delete'),
    path('categories', views.categories_index, name='categories_index'),
    path('categories/create', views.categories_create, name='categories_create'),
    path('categories/rename', views.categories_rename, name='categories_rename'),
    path('categories/delete', views.categories_delete, name='categories_delete'),
    path('palette', views.palette, name='palette'),
]