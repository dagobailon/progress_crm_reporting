from django import forms
from django.forms import ModelForm
from reporting_queries.models import Query

class AddQueryForm(forms.Form):
    query = forms.CharField(label = 'query', max_length=500)  
    name = forms.CharField(label = 'name', max_length=120)
    description = forms.CharField(label = 'description')