from django.shortcuts import render
from django.contrib import messages
from django.core.urlresolvers import reverse
from django.http import HttpResponseRedirect
from django.db import connection 
from django.views.generic.base import TemplateView

from reporting_queries.models import Person, Query #need to add more models

class HomePageView(TemplateView):
    template = "index.html"

    def get(self, request, **kwargs):
        queries = Query.objects.all()
        context = { 
            'queries':queries
        }
        return render(request, self.template, context)

class ResultsView(TemplateView):
    template = "results.html"

    def get(self, request, **kwargs):
        report_id = kwargs.get('id')
        query = Query.objects.get(id = report_id)
        context = {
            'query':query
        }
        return render(request, self.template, context)

#     def get_query(request):
#         query = Query.object.all() #This will bring up all of the queries model
#         return render(request, {'query':query})


# class SQLResultView(TemplateView):
#     template_name = "results.html"

#     def result(self):
#         cursor = connection.cursor()
#         cursor.execute()
#         result = cursor.fetchall()
#         return result

#     def get_context_data(self, **kwargs):
#         context = super(SQLResultView, self).get_context_data(**kwargs)

#         try:
#             context['query_result'] = self.request.session['sql_result']
#         except KeyError:
#             messages.error('No SQL query result found, please write one here.')
#             return HttpResponseRedirect(reverse('sql_query_form'))

#         return context
