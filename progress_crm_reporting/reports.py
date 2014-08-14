from reporting_queries.models import Person
from model_report.report import reports, ReportAdmin

class PersonReport(ReportAdmin):
    pass

    
class PersonReport(ReportAdmin):
    title = 'person Report Name'
    model = Person
    fields = [
        'given_name','family_name',
    ]
    list_order_by = ('given_name',)
    type = 'report'

reports.register('person-report', PersonReport)