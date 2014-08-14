#Section 1: Imports
from django import forms
from django.forms import ModelForm
from reporting_queries.models import Query

#Section 2: Forms
class AddQueryForm(forms.Form):
#form to create the empty fields for the Query model. 
    query = forms.CharField(label = 'query', max_length=500, required=True)  
    name = forms.CharField(label = 'name', max_length=120, required=True)
    description = forms.CharField(label = 'description', required=True)