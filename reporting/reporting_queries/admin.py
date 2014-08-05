from django.contrib import admin
from reporting_queries.models import Person, PostalAddress, EmailAddress, PhoneNumber, Query, PersonPostalAddress, PersonEmailAddress, PersonPhoneNumber
# Register your models here.


class PersonAdmin(admin.ModelAdmin):
    list_display = ('family_name', 'given_name', 'gender', 'birthdate')


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