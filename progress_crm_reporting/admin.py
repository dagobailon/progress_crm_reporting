from django.contrib import admin
from reporting_queries.models import Person, PostalAddress, EmailAddress, PhoneNumber, Query, PersonPostalAddress, PersonEmailAddress, PersonPhoneNumber
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

class PersonAdmin(admin.ModelAdmin):
    list_display = ('family_name', 'given_name', 'gender', 'birthdate')
    actions = [export_csv]


class PostalAddressAdmin(admin.ModelAdmin):
    list_display = ('address_type', 'address_line', 'postal_code')

class EmailAddressAdmin(admin.ModelAdmin):
    list_display = ('address', 'address_type')

class PhoneNumberAdmin(admin.ModelAdmin):
    list_display = ('number', 'number_type')

class QueryAdmin(admin.ModelAdmin):
    list_display = ('query', 'name', 'description')

class PersonPostalAddressAdmin(admin.ModelAdmin):
    list_display = ('person', 'postal_address', 'primary')

class PersonEmailAddressAdmin(admin.ModelAdmin):
    list_display = ('person', 'email_address')

class PersonPhoneNumberAdmin(admin.ModelAdmin):
    list_display = ('person', 'phone_number')

admin.site.register(Person, PersonAdmin)
admin.site.register(PostalAddress, PostalAddressAdmin)
admin.site.register(EmailAddress, EmailAddressAdmin)
admin.site.register(PhoneNumber, PhoneNumberAdmin)
admin.site.register(Query, QueryAdmin)
admin.site.register(PersonPostalAddress, PersonPostalAddressAdmin)
admin.site.register(PersonEmailAddress, PersonEmailAddressAdmin)
admin.site.register(PersonPhoneNumber, PersonPhoneNumberAdmin)