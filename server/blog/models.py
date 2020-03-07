from django.db import models


class Blog(models.Model):
	author = models.CharField(max_length=20)
	title = models.CharField(max_length=30)
	content = models.TextField()

	def __str__(self):
		return self.title + ' --' + self.author