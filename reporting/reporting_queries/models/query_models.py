from django.db import models

# Create you models here.

class Query(models.Model):
    query = models.CharField()  
    name = models.CharField(max_length=120)
    description = models.CharField()

    class Meta:
        app_label = 'reporting_queries'
        db_table = 'reporting_queries_Query'
  