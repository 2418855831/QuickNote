from django.contrib import admin

from .models import Category, Blog


class CategoryAdmin(admin.ModelAdmin):
    fields = ['name']


class BlogAdmin(admin.ModelAdmin):
    fields = ['title', 'views_count', 'content']


admin.site.register(Category, CategoryAdmin)
admin.site.register(Blog, BlogAdmin)
