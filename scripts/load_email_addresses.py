import csv
from reporting_queries.models import EmailAddress

with open('emails.csv', 'rb') as csvfile:
	emails_reader = csv.reader(csvfile, delimiter=',', quotechar='"')
	for row in emails_reader:
		print row[1] + " is a " + row[2] + " address."
		e = EmailAddress(address=row[1], address_type=row[2])
		e.save()
