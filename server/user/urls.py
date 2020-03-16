from django.urls import path
from user import views


app_name = 'user'

urlpatterns = [
    path('', views.index, name='index'),
    path('login', views.login, name='login'),
    path('logout', views.logout, name='logout')
]