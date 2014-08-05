from django.conf.urls import patterns, include, url

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    url(r'', include('reporting_queries.urls', namespace="reporting_queries")),
    url(r'^admin/', include(admin.site.urls)),
)
