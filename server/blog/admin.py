from django.contrib import admin

from .models import Blog


class BlogAdmin(admin.ModelAdmin):
	fields = ['title', 'author', 'content']

admin.site.register(Blog, BlogAdmin)