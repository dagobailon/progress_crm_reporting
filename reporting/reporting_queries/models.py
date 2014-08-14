import datetime
from django.db import models
from django.core.exceptions import ValidationError
from jsonfield import JSONField 
from django.contrib.contenttypes.generic import GenericForeignKey, GenericRelation
from django.contrib.contenttypes.models import ContentType

SYNC_CHOICES = (
    ('Pending', 'pending'),
    ('Running', 'running'),
    ('Complete', 'complete'),
    ('Error', 'error')
)

class SyncOperation(models.Model):
    sync_at = models.DateTimeField()
    type = models.CharField(max_length=255)
    current_record = models.IntegerField()
    total_records = models.IntegerField()
    errors = models.TextField()
    organization = models.ForeignKey('Organization', related_name='sync_ops')
    status = models.CharField(max_length=255, choices=SYNC_CHOICES)

    created_at = models.DateTimeField(null=True, blank=True)
    updated_at = models.DateTimeField(null=True, blank=True)

class Organization(models.Model):
    name = models.CharField(max_length=255)
    abbreviation = models.CharField(max_length=31)
    parent = models.ForeignKey('Organization', related_name='children')
    address = models.ForeignKey('PostalAddress')

    created_at = models.DateTimeField(null=True, blank=True)
    updated_at = models.DateTimeField(null=True, blank=True)


class Recipient(models.Model):
    '''
    Recipient
    ---------
    This model represents the recipient of a donation.  Mutliple recipients could be part of the
    same donation action, i.e. when doing "bundling"

    Fields
    ------
    display_name - The name to be displayed when viewing donation information
    legal_name - Name registered with the FEC, etc.
    amount - Amount of donation to this recipient
    '''
    display_name = models.CharField(max_length=255)
    legal_name = models.CharField(max_length=255, null=True, blank=True)
    amount = models.DecimalField(decimal_places=2, max_digits=11)
    donation = models.ForeignKey('Donation', related_name='recipients')

    created_at = models.DateTimeField(null=True, blank=True)
    updated_at = models.DateTimeField(null=True, blank=True)

    def __unicode__(self):
        return self.display_name

PAYMENT_METHOD_CHOICES = (
    ("credit_card", "Credit Card"),
    ("check", "Check"),
    ("cash", "Cash"),
    ("electronic_funds_transfer", "Electronic Funds Transfer")
)

class FundraisingPage(models.Model):
    '''
    FundraisingPage
    ---------------
    Represents a page or action collecting one or more donations

    Fields
    ------
    identifiers - The OSDI identifiers of this page
    originating_system - Human readable text identifying where this page originated
    created_at - Date and Time of creation
    modified_at - Date and Time of last modification
    name - The name of the page
    title - The title of the page
    summary - The summary of the page
    description - The description of the page
    url - The URL of the fundraising page
    total_donations - Computed value of total donations made to the page
    total_revenue - Computed value of total donation revenue made to this page
    currency - ISO 4217 designation of currency. Example: USD, JPY
    creator - The person representing the creator of the fundraising page
    donations - Collection of donations made from this page
    '''
    identifiers = models.TextField()
    originating_system = models.CharField(max_length=255)
    created_at = models.DateTimeField()
    modified_at = models.DateTimeField()
    name = models.CharField(max_length=255)
    title = models.CharField(max_length=255)
    summary = models.CharField(max_length=1023)
    description = models.TextField(blank=True)
    url = models.URLField()
    currency = models.CharField(max_length=255)
    creator = models.ForeignKey('Person')
    #donations = reverse relationship

    created_at = models.DateTimeField(null=True, blank=True)
    updated_at = models.DateTimeField(null=True, blank=True)

    @property
    def total_donations(self):
        pass

    @property
    def total_revenue(self):
        pass

    class Meta:
        app_label = 'reporting_queries'
        db_table = 'reporting_queries_FundraisingPage'

    def __unicode__(self):
        return self.name

class Donation(models.Model):
    '''
    Donation
    --------
    This class represents a recorded donation.

    Fields
    ------
    identifiers - The OSDI identifiers of this donation
    created_at  - Date and Time of creation
    modified_at - Date and Time of last modification
    originating_system - The original donation system. Example: ActBlue
    donor - Donor data collected at the time of donation
    donated_at - Date of the donation
    amount - Amount of total donation (after any credits) in specified currency
    credited_amount - Amount credited back to donor in specified currency
    credited_at - Date of the credit
    currency - ISO 4217 designation of currency. Example: USD, JPY
    recipients - Array of recipients associated with the donation
    payment - A hash of payment details
    payment.method - A flexible enumeration of "Credit Card", "Check", "Cash", "Electronic Funds Transfer"
    payment.reference_number - A check number, transaction ID, or some other information referencing the payment
    payment.authorization_stored - Indicates if payment information has been stored for future automatic payments
    subscription_instance - A sequence number or some other value unique to this instance of the donation in the context of a subscription. Examples: 5, JAN-2014
    voided - Indicates if the donation has been voided
    voided_at - Date of the void
    url - URL at which the donation was taken
    sources - Array of sources associated with the donation
    attributions - Array of attributions associated with the donation
    fundraising_page - The related fundraising page the donation was taken on
    '''
    identifiers = models.TextField()
    originating_system = models.CharField(max_length=255)
    donor = models.ForeignKey('Person')
    donated_at = models.DateField()
    amount = models.DecimalField(decimal_places=2, max_digits=11)
    credited_amount = models.DecimalField(decimal_places=2, max_digits=11, null=True, blank=True)
    credited_at = models.DateTimeField(null=True, blank=True)
    currency = models.CharField(max_length = 255)
    # recipients - Reverse relationship
    payment = JSONField()
    ## Fields within payment hash
    #payment.method
    #payment.reference_number
    #payment.authorization_stored
    subscription_instance = models.CharField(max_length=255, blank=True, null=True)
    voided = models.BooleanField(default=False)
    voided_at = models.DateField(null=True, blank=True)
    url = models.URLField()
    sources = models.TextField(null=True, blank=True)
    attributions = models.TextField(null=True, blank=True)
    fundraising_page = models.ForeignKey('FundraisingPage', null=True, blank=True)

    created_at = models.DateTimeField(null=True, blank=True)
    updated_at = models.DateTimeField(null=True, blank=True)

    def __unicode__(self):
        return "Donation by {0} of {1} on {2}".format(self.donor, self.amount, self.donated_at)

EVENT_STATUS_CHOICES = (
    ('confirmed', 'Confirmed'),
    ('tentative', 'Tentative'),
    ('cancelled', 'Cancelled')
)

TRANSPARENCE_CHOICES = (
    ('opaque', 'Opaque'),
    ('transparent', 'Transparent')
)

VISIBILITY_CHOICES = (
    ('public', 'Public'),
    ('private', 'Private')
)

METHOD_CHOICES = (
    ('email', 'Email'),
    ('sms', 'SMS')
)

class Event(models.Model):
    identifier = models.CharField(max_length=255)
    status = models.CharField(max_length=255, choices=EVENT_STATUS_CHOICES, default='tentative')
    summary = models.CharField(max_length=1023)
    description = models.TextField(blank=True)
    location = models.ForeignKey('PostalAddress')
    creator = models.ForeignKey('Person', related_name="created_events")
    organizer = models.ForeignKey('Person', related_name="organized_events", blank=True, null=True)
    start = models.DateTimeField()
    end = models.DateTimeField()
    all_day_date = models.DateField(blank=True, null=True)
    all_day = models.BooleanField(default=False)
    #recurrance = TBD
    transparence = models.CharField(max_length=255, choices=TRANSPARENCE_CHOICES, default='opaque')
    visibility = models.CharField(max_length=255, choices=VISIBILITY_CHOICES, default='public')
    # attendees = one to many with Attendees
    guests_allowed = models.BooleanField(default=False)
    reminders = JSONField(blank=True, null=True)
    method = models.CharField(max_length=127, choices=METHOD_CHOICES, blank=True, null=True)
    minutes = models.IntegerField(blank=True, null=True)
    capacity = models.IntegerField(blank=True, null=True)

    created_at = models.DateTimeField(null=True, blank=True)
    updated_at = models.DateTimeField(null=True, blank=True)

    _total_accepted = None

    @property
    def total_accepted(self):
        if not self._total_accepted:
            self._total_accepted = self.attendees.filter(status='accepted').count()
        return self._total_accepted

    def __unicode__(self):
        return self.summary

    def save(self):
        if not self.pk and not self.created:
            self.created = datetime.datetime.now()

        # Set updated field unless a new record with an existing updated field
        if not (not self.pk and self.updated):
            self.updated = datetime.datetime.now()

        return super(Event, self).save()


ATTENDANCE_STATUS_CHOCIES = (
    ('declined', 'Declined'),
    ('tentative', 'Tentative'),
    ('accepted', 'Accepted'),
    ('needs_action', 'Needs Action')
)

class Attendance(models.Model):
    identifier = models.CharField(max_length=255)
    event = models.ForeignKey(Event)
    person = models.ForeignKey('Person', related_name="events_attended")
    status = models.CharField(max_length=127, choices=ATTENDANCE_STATUS_CHOCIES, default='tentative')
    attended = models.NullBooleanField()
    comment = models.TextField()
    invited_by = models.ForeignKey('Person', related_name="guests_invited")

    created_at = models.DateTimeField(null=True, blank=True)
    updated_at = models.DateTimeField(null=True, blank=True)

class Form(models.Model):
    """
    identifiers Identifier[]    An array of identifiers the provider has determined to be associated with the form
    created_date    datetime    Date and Time of creation
    modified_date   datetime    Date and Time of last modification
    name    string  name of the form
    title   string  title of the form
    summary string  summary of the form
    description string/html string  description of the form, optionally an HTML string
    call_to_action  string  Text of the call to action of the form (ex: Fill out our survey)
    url string  A URL string pointing to the publicly available form page on the web
    total_submissions   integer Read-only computed property representing the current count of submissions on the form
    creator Person* A single embedded instance of a person representing the creator of the form
    submissions Submissions[]*  A Collection of Submission resources
    """
    identifiers = models.CharField(max_length=1024)
    name = models.CharField(max_length=512)
    title = models.CharField(max_length=512)
    summary = models.TextField()
    description = models.TextField()
    call_to_action = models.TextField()
    url = models.URLField()
    creator = models.ForeignKey('Person', null=True, blank=True)
    
    created_at = models.DateTimeField()
    updated_at = models.DateTimeField()

    def total_submissions(self):
        """
        Returns the total number of submissions to this form.
        """
        pass

class Submission(models.Model):
    """
    identifiers Identifier[]    An array of identifiers the provider has determined to be associated with the form
    created_date    datetime    Date and Time of creation
    modified_date   datetime    Date and Time of last modification
    person  Person* An embedded person that made the submission on the referenced form
    form    Form*   A reference to the form this submission is related to
    question_answers    Question_Answers[]* A Collection of Question Answer resources related to this submission
    """
    identifiers = models.CharField(max_length=1024)
    person = models.ForeignKey('Person', related_name="form_submissions")
    form = models.ForeignKey(Form, related_name="submissions")
    #question_answers

    created_at = models.DateTimeField()
    updated_at = models.DateTimeField()

class List(models.Model):
    '''
    A list that is capable of holding items of any type.

    identifier      string  A internally unique identifier, usually URL friendly
    name            string  Name of list
    description     string  A description of a list, eg "2012 donors"
    type            string  A string description of the type of resources, eg "events"
    is_dynamic      bool    A boolean value that indicates if the list is static or dynamic
    '''
    identifier = models.CharField(max_length=1023)
    name = models.CharField(max_length=1023)
    description = models.TextField(blank=True, null=True)
    type = models.CharField(max_length=127)
    is_dynamic = models.NullBooleanField()

    created_at = models.DateTimeField(null=True, blank=True)
    updated_at = models.DateTimeField(null=True, blank=True)
    #items = reverse relation

    def __unicode__(self):
        return self.name

    def item_count(self):
        return self.items.count()

class ListItem(models.Model):
    '''
    We use Django's GenericRelation to create a list model that can hold any
    other type of model.
    '''
    list = models.ForeignKey(List, related_name='items')
    content_type = models.ForeignKey(ContentType)
    object_id = models.PositiveIntegerField()
    content_object = GenericForeignKey('content_type', 'object_id')
    
    created_at = models.DateTimeField(null=True, blank=True)
    updated_at = models.DateTimeField(null=True, blank=True)

    class Meta:
        unique_together = ['list', 'content_type', 'object_id']

    def __unicode__(self):
        return u"List item {0} - {1}".format(content_type, object_id)

GENDER_CHOICES = (
    ('female', 'Female'),
    ('male', 'Male'),
    ('other', 'Other')
)

PARTY_CHOICES = (
    ('none', 'None'),
    ('democrat', 'Democrat'),
    ('republican', 'Republican'),
    ('independent', 'Independent')
)

# Data model for a person based on OSDI
# spec, found here: https://github.com/opensupporter/osdi-docs/blob/master/people.md

class Person(models.Model):
    # Person id fields
    family_name = models.CharField(max_length=255, null=True, blank=True)
    given_name = models.CharField(max_length=255, null=True, blank=True)
    additional_name = models.CharField(max_length=255, null=True, blank=True)
    honorific_prefix = models.CharField(max_length=255, null=True, blank=True)
    honorific_suffix = models.CharField(max_length=255, null=True, blank=True)
    gender = models.CharField(max_length=7, choices=GENDER_CHOICES, null=True, blank=True)
    gender_identity = models.CharField(max_length=255, null=True, blank=True)
    party_identification = models.CharField(max_length=127, choices=PARTY_CHOICES, null=True, blank=True)
    
    # Source of this person's first instance
    source = models.CharField(max_length=255)
    
    birthdate = JSONField(max_length=128, null=True, blank=True)
    birthdate_month = models.IntegerField(null=True, blank=True)
    birthdate_day = models.IntegerField(null=True, blank=True)
    birthdate_year = models.IntegerField(null=True, blank=True)

    # Ethnographic data 
    ethnilocality = models.CharField(max_length=255, null=True, blank=True)
    languages_spoken = models.TextField(null=True, blank=True)

    # Employer data
    employer = models.CharField(max_length=255, null=True, blank=True)
    occupation = models.CharField(max_length=255, null=True, blank=True)

    # External identifiers
    identifiers = models.TextField(null=True, blank=True)

    postal_addresses = models.ManyToManyField('PostalAddress', through='PersonPostalAddress')
    email_addresses = models.ManyToManyField('EmailAddress', through='PersonEmailAddress')
    phone_numbers = models.ManyToManyField('PhoneNumber', through='PersonPhoneNumber')
    # profiles reverse relation to Profile model

    created_at = models.DateTimeField(null=True, blank=True)
    updated_at = models.DateTimeField(null=True, blank=True)

    _primary_email = None

    class Meta:
        verbose_name_plural = 'people'

    def __unicode__(self):
        return u"{0}".format(self.name())

    def name(self):
        return u"{0} {1}".format(self.given_name, self.family_name)

    def primary_email(self):
        if not self._primary_email:
            try:
                self._primary_email = self.personemailaddress_set.get(primary=True).email_address.address
            except PersonEmailAddress.DoesNotExist:
                self._primary_email = 'No email'
        return self._primary_email

    def add_identifier(self, identifier):
        id_array = self.identifiers.split(',')
        if identifier not in id_array:
            id_array.append(identifier)
            self.identifiers = ','.join(id_array)

POSTAL_ADDRESS_TYPES = (
    ('home', 'Home'),
    ('work', 'Work'),
    ('mailing', 'Mailing'),
)

GEO_ACCURACY_CHOICES = (
    ('rooftop', 'Rooftop'),
    ('approximate', 'Approximate'),
)

POSTAL_ADDRESS_STATUS_CHOICES = (
    ('potential', 'Potential'),
    ('verified', 'Verified'),
    ('bad', 'Bad'),
)

class PostalAddress(models.Model):
    address_type = models.CharField(max_length=255, choices=POSTAL_ADDRESS_TYPES)
    address_line = JSONField(null=True, blank=True)
    locality = models.CharField(max_length=255)
    region = models.CharField(max_length=2)
    postal_code = models.CharField(max_length=63)
    country = models.CharField(max_length=2)
    language = models.CharField(max_length=63, null=True, blank=True)
    location = JSONField(max_length=255, null=True, blank=True)
    latitude = models.FloatField(null=True, blank=True)
    longitude = models.FloatField(null=True, blank=True)
    accuracy = models.CharField(max_length=31, choices=GEO_ACCURACY_CHOICES, blank=True, null=True)
    status = models.CharField(max_length=31, choices=POSTAL_ADDRESS_STATUS_CHOICES)

    created_at = models.DateTimeField(null=True, blank=True)
    updated_at = models.DateTimeField(null=True, blank=True)


    def __unicode__(self):
        return "{0}".format(self.address_line)

class PersonPostalAddress(models.Model):
    person = models.ForeignKey(Person)
    postal_address = models.ForeignKey(PostalAddress)
    primary = models.BooleanField(default=False)

    created_at = models.DateTimeField(null=True, blank=True)
    updated_at = models.DateTimeField(null=True, blank=True)

    class Meta:
        unique_together = ['person', 'postal_address']

EMAIL_TYPE_CHOICES = (
    ('personal', 'Personal'),
    ('work', 'Work')
)

class EmailAddress(models.Model):
    address = models.CharField(max_length=254)
    address_type = models.CharField(max_length=255)

    class Meta:
        app_label = 'reporting_queries'
        db_table = 'reporting_queries_EmailAddress'
    def __unicode__(self):
        return "{0} ({1})".format(self.address, self.address_type)

class PersonEmailAddress(models.Model):
    person = models.ForeignKey(Person)
    email_address = models.ForeignKey(EmailAddress)
    primary = models.BooleanField(default=False)

    created_at = models.DateTimeField(null=True, blank=True)
    updated_at = models.DateTimeField(null=True, blank=True)

    class Meta:
        unique_together = ['person', 'email_address']

PHONE_TYPE_CHOICES = (
    ('home', 'Home'),
    ('work', 'Work'),
    ('mobile', 'Mobile'),
    ('other', 'Other'),
    ('daytime', 'Daytime'),
    ('evening', 'Evening'),
    ('fax', 'Fax')
)

class PhoneNumber(models.Model):
    number = models.CharField(max_length=15)
    extension = models.CharField(max_length=4, null=True, blank=True)
    number_type = models.CharField(max_length=31, choices=PHONE_TYPE_CHOICES, null=True, blank=True)
    operator = models.CharField(max_length=63, blank=True, null=True)
    country = models.CharField(max_length=2)
    sms_capable = models.BooleanField(default=False)
    do_not_call = models.BooleanField(default=False)

    created_at = models.DateTimeField(null=True, blank=True)
    updated_at = models.DateTimeField(null=True, blank=True)

    class Meta:
        unique_together = ('number', 'extension',)

    def clean(self):
        if self.number == '' or not self.number:
            raise ValidationError('A number must be provided.')

        self.number = self.number.replace(r'[^0-9]', '')

class PersonPhoneNumber(models.Model):
    person = models.ForeignKey(Person)
    phone_number = models.ForeignKey(PhoneNumber)
    primary = models.BooleanField(default=False)
    description = models.TextField()

    created_at = models.DateTimeField(null=True, blank=True)
    updated_at = models.DateTimeField(null=True, blank=True)

    class Meta:
        unique_together = ['person', 'phone_number']

class Profile(models.Model):
    person = models.ForeignKey(Person, related_name='profiles')
    provider = models.CharField(max_length=63)
    identifier = models.CharField(max_length=255)
    url = models.URLField()
    handle = models.CharField(max_length=127)

    created_at = models.DateTimeField(null=True, blank=True)
    updated_at = models.DateTimeField(null=True, blank=True)

    class Meta:
        unique_together = ['person', 'provider', 'identifier']

    def __unicode__(self):
        return u"{0}'s {1} profile".format(person.name(), provider)

class Query(models.Model):
# Query model is added to allow the reporting application to store SQL queries
    query = models.CharField(max_length=500)  
    name = models.CharField(max_length=120)
    description = models.TextField()

