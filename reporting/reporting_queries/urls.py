from django.conf.urls import patterns, url
from reporting_queries import views


urlpatterns = patterns('',
    url(r'^$', HomePageView, name = 'home'),
    url(r'^(?:reporting_queries/)?results/(?P<id>[0-9]+)$', ResultsView.as_view(), name ='results'),

    )