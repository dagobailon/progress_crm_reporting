import csv
EMAIL = 0
FIRST_NAME = 1

with open ('Candidates.csv', 'rb') as csvfile:
    candidates = csv.reader(csvfile, delimiter=',', quotechar='|')
    for row in candidates:
        # print ', '.join(row)
        if row[13] == 'CA':
        	print ('CALIFORNIA!!!!!!')


        # print (row)
