from django.shortcuts import render
from django.views.generic import TemplateView

class ChooseReport(TemplateView):
    template_name = "reporting_queries/report.html"


