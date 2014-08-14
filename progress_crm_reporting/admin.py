from django.contrib import admin
from .models import Query
from django.http import HttpResponse

# Register your models here.
# this function allows you to export all people from Model Person
def export_csv(modeladmin, request, queryset):
    import csv
    from django.utils.encoding import smart_str
    response = HttpResponse(mimetype='text/csv')
    response['Content-Disposition'] = 'attachment; filename=people.csv'
    writer = csv.writer(response, csv.excel)
    response.write(u'\ufeff'.encode('utf8')) # BOM (optional...Excel needs it to open UTF-8 file properly)
    writer.writerow([
        smart_str(u"ID"),
        smart_str(u"given_name"),
        smart_str(u"family_name"),
    ])
    for obj in queryset:
        writer.writerow([
            smart_str(obj.pk),
            smart_str(obj.given_name),
            smart_str(obj.family_name),
        ])
    return response
export_csv.short_description = u"Export CSV"



class QueryAdmin(admin.ModelAdmin):
    list_display = ('query', 'name', 'description')




admin.site.register(Query, QueryAdmin)
