from django.db import models

# Create your models here.

class FakeReport(models.Model):
    text = models.CharField(max_length = 250)

