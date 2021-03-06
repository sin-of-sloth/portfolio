from django.db import models

class Project(models.Model):
    title = models.CharField(max_length=100)
    description = models.CharField(max_length=250)
    image = models.ImageField(upload_to='portfolio/images/')
    url = models.URLField(blank=True)
    order = models.IntegerField(default=99)

    def __str__(self):
        return str(self.id) + '- ' + self.title