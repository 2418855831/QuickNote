from django.urls import path
from blog import views


app_name = 'blog'

urlpatterns = [
    path('', views.index, name='index'),
    path('create', views.create, name='create'),
    path('rename', views.rename, name='rename'),
    path('save', views.save, name='save'),
    path('incre-views-count', views.incre_views_count, name='incre_views_count'),
    path('delete', views.delete, name='delete'),
    path('dirs', views.dirs_index, name='dirs_index'),
    path('dirs/create', views.dirs_create, name='dirs_create'),
    path('dirs/rename', views.dirs_rename, name='dirs_rename'),
    path('dirs/delete', views.dirs_delete, name='dirs_delete'),
]