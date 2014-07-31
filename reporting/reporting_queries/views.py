from django.shortcuts import render
from django.contrib import messages
from django.core.urlresolvers import reverse
from django.http import HttpResponseRedirect
from django.db import connection 

from reporting_queries.models import Person #need to add more models

# Create your views here.

class HomePageView(TemplateView):
    template = index.html

    def result(self):
        cursor = connection.cursor()
        cursor.execute()
        result = cursor.fetchall()
        return result

class SQLResultView(TemplateView):
    template_name = "result.html"

    def get_context_data(self, **kwargs):
        context = super(SQLResultView, self).get_context_data(**kwargs)

        try:
            context['query_result'] = self.request.session['sql_result']
        except KeyError:
            messages.error('No SQL query result found, please write one here.')
            return HttpResponseRedirect(reverse('sql_query_form'))

        return context