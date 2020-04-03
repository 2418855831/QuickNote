from django.db import models


class Category(models.Model):
    """博客分类"""
    name = models.CharField(max_length=20, unique=True)
    created_date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'Category'
        verbose_name_plural = 'Categories'


class Blog(models.Model):
    """博客"""
    category = models.ForeignKey(to=Category, on_delete=models.CASCADE, related_name='blogs')
    title = models.CharField(max_length=40)
    content = models.TextField()
    created_date = models.DateTimeField(auto_now_add=True)
    updated_date = models.DateTimeField(auto_now=True)
    views_count = models.IntegerField(default=0)

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = 'Blog'
        verbose_name_plural = 'Blogs'
