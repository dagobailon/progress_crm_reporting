from django.conf.urls import patterns, url

from reporting_queries.views import HomePageView, ResultsView

urlpatterns = patterns('',
    url(r'^$', HomePageView.as_view(), name = 'home'),
    url(r'^results/(?P<id>[0-9]+)$', ResultsView.as_view(), name ='results'),
    )

