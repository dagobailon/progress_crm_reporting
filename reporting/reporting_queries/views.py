from django.shortcuts import render
from django.contrib import messages
from django.core.urlresolvers import reverse
from django.http import HttpResponseRedirect, HttpResponse
from django.db import connection 
from django.views.generic.base import TemplateView

from reporting_queries.models import * #need to add more models

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
        # We'll need to figure out how to have it query the correct table (not every query is 
        # about PostalAddresses.
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
    def get(self, request, **kwargs):
        report_id = kwargs.get('id')
        desired_query = Query.objects.get(id = report_id)
        raw_sql = desired_query.query
        # We'll need to figure out how to have it query the correct table (not every query is 
        # about PostalAddresses.
        cursor = connection.cursor()
        cursor.execute(raw_sql)
        results = cursor.fetchall()
        headers = [desc[0] for desc in cursor.description]
        context = {
            'results':results,
            'headers':headers
        }
        return self.export_csv(headers, request, results)
    

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
        
            
