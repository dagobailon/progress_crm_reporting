from django.conf.urls import patterns, url
from .views import HomePageView, ResultsView, ResultCsvView, AddQueryView




urlpatterns = patterns('',

    url(r'^$', HomePageView.as_view(), name = 'home'),
    url(r'^results/(?P<id>[0-9]+)$', ResultsView.as_view(), name ='results'),
    url(r'^export/(?P<id>[0-9]+)$', ResultCsvView.as_view(), name = 'export'),
    url(r'^add_query/', AddQueryView.as_view(), name = 'add_query'),

    )

