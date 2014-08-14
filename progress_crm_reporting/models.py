import datetime
from django.db import models


class Query(models.Model):
# Query model is added to allow the reporting application to store SQL queries
    query = models.CharField(max_length=500)  
    name = models.CharField(max_length=120)
    description = models.TextField()

