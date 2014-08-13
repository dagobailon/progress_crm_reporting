from django.shortcuts import render
from django.contrib import messages
from django.core.urlresolvers import reverse
from django.http import HttpResponseRedirect, HttpResponse
from django.db import connection 
from django.views.generic.base import TemplateView
from django.core.exceptions import ValidationError
from django.template import RequestContext

from reporting_queries.models import * #need to add more models
from reporting_queries.forms import AddQueryForm

class HomePageView(TemplateView):

    template = "index.html"

    def get(self, request, **kwargs):
        queries = Query.objects.all()
        context = { 
            'queries':queries,
        }
        return render(request, self.template, context)

class ResultsView(TemplateView):
    template = "results.html"

    def get(self, request, **kwargs):
        report_id = kwargs.get('id')
        desired_query = Query.objects.get(id = report_id)
        raw_sql = desired_query.query
        cursor = connection.cursor()
        cursor.execute(raw_sql)
        results = cursor.fetchall()
        headers = [desc[0] for desc in cursor.description]
        context = {
            'results':results,
            'headers':headers,
            'report_id':report_id
        }
        return render(request, self.template, context)

class ResultCsvView(TemplateView):
# This function executes rawSQL, and returns results    
    def get(self, request, **kwargs):
        report_id = kwargs.get('id')
        desired_query = Query.objects.get(id = report_id)
        raw_sql = desired_query.query
        cursor = connection.cursor()
        cursor.execute(raw_sql)
        results = cursor.fetchall()
#  This line is to get header for csv
        headers = [desc[0] for desc in cursor.description]
        context = {
            'results':results,
            'headers':headers
        }
        return self.export_csv(headers, request, results)
    
# This function exports and writes the CSV
    def export_csv(self, headers, request, results):
        import csv
        from django.utils.encoding import smart_str
        response = HttpResponse(mimetype='text/csv')
        response['Content-Disposition'] = 'attachment; filename=query.csv'
        writer = csv.writer(response, csv.excel)
        response.write(u'\ufeff'.encode('utf8')) # BOM (optional...Excel needs it to open UTF-8 file properly)
        writer.writerow(headers)
        for obj in results:
            writer.writerow(obj)
        return response
        
class AddQueryView(TemplateView):
    def get(self, request, **kwargs):
        form = AddQueryForm()
        template = "add_query.html"
        return render(request, 'add_query.html', {'form' : form})

    def post(self, request, **kwargs):
        if request.method == 'POST':
            form = AddQueryForm(request.POST)
            if form.is_valid():
                name = request.POST.get('name')
                description = request.POST.get('description')
                query = request.POST.get('query')
                if name and description and query:
                    q = Query(name = name, description = description, query = query)
                    q.save()
                return HttpResponseRedirect('/')
            else:
                print 'FAIL'
        else:
            form = AddQueryForm()
            return render_to_respond(request, 'add_query.html', {'form' : form})


        # if name and description and query:
        #     q = Query(name = name, description = description, query = query)
        #     q.save()
        #     return HttpResponseRedirect('/')

        # return render(request, self.template)
