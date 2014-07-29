from django.conf.urls import patterns, include, urls
from reporting_queries import views

urlpatterns = patterns('',
    url(r'^choose/',)
    url(r'^(?P<Query_id>\d+)report/$', views.report, name='report'),
 )