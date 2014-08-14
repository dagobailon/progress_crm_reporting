from progress_crm.plugins import CRMDashboardModule

class CRMReportingModule(CRMDashboardModule):
    title = 'Reporting'

    def is_empty():
        return False 

    def init_with_context(self, context):
        context['queries'] = Query.objects.all()