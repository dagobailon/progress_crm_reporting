#Section 1: Import tools
#=======================

from django.shortcuts import render, render_to_response
from django.contrib import messages
from django.core.urlresolvers import reverse
from django.http import HttpResponseRedirect, HttpResponse
from django.db import connection 
from django.views.generic.base import TemplateView
from django.core.exceptions import ValidationError
from django.template import RequestContext

from .models import * 
# * pulls all models from models.py
from .forms import AddQueryForm



#Section 2: Class based views:
#=============================

#This view renders the landing page and calls all queries saved in the database
class HomePageView(TemplateView):
#calling the html page in the templates 
    template = "index.html"

    def get(self, request, **kwargs):
        queries = Query.objects.all()
        context = { 
            'queries':queries,
        }
        return render(request, self.template, context)

class ResultsView(TemplateView):
    #This fuction executes raw SQL and returns the data in the variable results
    template = "results.html"

    def get(self, request, **kwargs):
        report_id = kwargs.get('id')
        desired_query = Query.objects.get(id = report_id)
        raw_sql = desired_query.query 
        #Pulls queries stored database
        cursor = connection.cursor() 
        #connection.cursor is used to creates connection to SQL
        cursor.execute(raw_sql) 
        results = cursor.fetchall() 
        #This variable will be called to return data from the SQL query
        headers = [desc[0] for desc in cursor.description] 
        #This pulls headers from the database
        context = {
            'results':results,
            'headers':headers,
            'report_id':report_id
        } 
        #context variable is a dictionary that holds data to be retuned on the html pages
        return render(request, self.template, context)

class ResultCsvView(TemplateView):
# This function executes rawSQL, returns results to be exported into a csv   
    def get(self, request, **kwargs): 
    #This method calls on the query to be prepped for csv export
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
        #imports for the csv export
        import csv
        from django.utils.encoding import smart_str
        #response variable prepares html to recieve results as a table
        response = HttpResponse(mimetype='text/csv')
        #Creates a download file as an attachment called query.csv
        response['Content-Disposition'] = 'attachment; filename=query.csv'
        writer = csv.writer(response, csv.excel)
        response.write(u'\ufeff'.encode('utf8')) 
        # BOM (optional...Excel needs it to open UTF-8 file properly)
        writer.writerow(headers) 
        #writes header to the csv
        for obj in results: #loops through data results to write rows into csv
            writer.writerow(obj)
        return response
        
class AddQueryView(TemplateView): #This view will render a form for the user to add a new query to the model Query
    def get(self, request, **kwargs):
    # This method gets the AddQueryForm from forms.py
        form = AddQueryForm()
        template = "add_query.html"
        return render(request, 'add_query.html', {'form' : form})

    def post(self, request, **kwargs):
    #This method allows the user to add raw SQL queries and description to the form 
        if request.method == 'POST':
            form = AddQueryForm(request.POST)
            if form.is_valid():
            #if form.is_valid fuction checks if information has been entered
                name = request.POST.get('name')
                description = request.POST.get('description')
                query = request.POST.get('query')
                if name and description and query:
                    q = Query(name = name, description = description, query = query)
                    q.save()
            return render(request, 'add_query.html', {'form' : form})
            

        else:
            form = AddQueryForm()
            return render_to_response(request, 'add_query.html', {'form' : form})
        #Else will render the form without having to enter information


