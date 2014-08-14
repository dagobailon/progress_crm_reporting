#Section 1: Imports
from django import forms
from django.forms import ModelForm
from .models import Query

#Section 2: Forms
class AddQueryForm(forms.Form):
#form to create the empty fields for the Query model. 
    query = forms.CharField(widget=forms.Textarea(attrs={'class': 'SQLform', 'placeholder':'SQL'}), label = 'query', max_length=500, required=True)  
    name = forms.CharField(widget=forms.TextInput(attrs={'class': 'form', 'placeholder': 'Name'}), label = 'name', max_length=120, required=True)
    description = forms.CharField(widget=forms.TextInput(attrs={'class': 'form', 'placeholder': 'Description'}), label = 'description', required=True)