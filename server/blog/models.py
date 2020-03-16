from django.db import models


class Blog(models.Model):
	author = models.CharField(max_length=20)
	title = models.CharField(max_length=30)
	content = models.TextField()
	created_date = models.DateTimeField(auto_now_add=True)
	updated_date = models.DateTimeField(auto_now=True)
	views_count = models.IntegerField(default=0)

	def __str__(self):
		return self.title + ' --' + self.author