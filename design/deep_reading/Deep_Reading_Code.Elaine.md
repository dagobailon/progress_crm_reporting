ActionKit Adapter Deep Read memo
==================================

Section 1: What does this code DO?
----------------------------------
Try to explain in as clear language as possible:
- One sentence: the overall purpose of the code is connect ActionKit CRM, pull in the data sets, convert, clean up and transfer the data to ProgressCRM. 

The overall fuction of the program includes:
(i) The ActionKit adapter first connect with the ActionKit API through the requirements: (1)organization's URL, (2)username and (3)password. 
(ii) ActionKit API restricts the import  batch sizse of 100 entries at a time. 
(iii) Next the methods "get_people" or "get_event" makes the request to import JSON objects from ActionKit data models
(iv) Data then goes through a matching process and uses the string method of .format to convert objects like person identifies ie 'id' from ActionKit to ProgressCRM. Each method processes each entry by checking if the object already exists in ProgressCRM and if not to create that entry and saves. 


Section 2: What dependencies/libraries/packages does it depend on?
-----------------------
(Otherwise known as: What are all those imports at the top of the file? What's dateutil.parser import parse? What's the ActionKit library?)
import re -Works like the "find and replace function"

import pytz -This library allows accurate and cross platform timezone calculations using Python 2.4 or higher. It also solves the issue of ambiguous times at the end of daylight saving time.

from dateutil.parser import parse -The parse method takes a date string (such as "Dec 25, 1995") and returns the number of milliseconds since January 1, 1970, 00:00:00 UTC. <-------------?????-------------------> <---- why this date is absolutely beyond me, multiple sources have this date ---->

from django.db import IntegrityError -Gives you an error when your key doesn't work, e.g. a foreign key check fails, duplicate key, etc.

from django.core.exceptions import ImproperlyConfigured -The ImproperlyConfigured exception is raised when Django is somehow improperly configured – for example, if a value in settings.py is incorrect or unparseable.

from django.contrib.contenttypes.models import ContentType -A content type is a reusable collection of metadata (columns), workflow, behavior, and other settings for a category of items or documents in a document library.. the skeleton of the data

from actionkit import ActionKit basically allows you to import data from the actionkit library ... python wrapper to allow us to interact with the actionkit API... basically the translator

from progress_crm.adapters.base_adapter import BaseAdapter -this is calling on the base_adapter so that you can use the method

from progress_crm.models import (Person, EmailAddress, PersonEmailAddress, PostalAddress, PersonPostalAddress, List, ListItem, Donation, Form, Submission) -This imports your models from the progress.crm database and puts it in the specified format, as listed.


Section 3: What other files within this app does this depend on?
-----------------------------------
ActionKit draws on BaseAdapter.py so that it can sync with ProgressCRM's data models. 


Section 4: What classes does this file define, and what do they do? Does it have methods?
----------------------------------------------
ActionkitAdapter(BaseAdapter) is for ....
Its methods are:
	def __init__: creates a new instance of this class
	def connect is 


Section 5: What functions does this file define (outside of classes), and what do they do? What inputs do they need and what do they return?
--------------------------------------------------
(In this case, all functions are class methods)













