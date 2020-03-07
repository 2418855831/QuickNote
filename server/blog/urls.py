from django.urls import path
from blog import views


app_name = 'blog'

urlpatterns = [
    path('', views.index),
    path('create', views.create),
    path('rename', views.rename),
    path('save', views.save),
    path('delete', views.delete),
    path('dirs', views.dirs_index),
    path('dirs/create', views.dirs_create),
    path('dirs/rename', views.dirs_rename),
    path('dirs/delete', views.dirs_delete),
]