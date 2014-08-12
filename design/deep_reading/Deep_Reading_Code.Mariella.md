ActionKit Adapter --- DEEP READING MEMO --- Mariella 
==================================


Section 1: What does this code DO?
----------------------------------
An open source CRM designed to provides a flexible framework for aggregating data from many vendors into one central database.
	(i) The ActionKit adapter takes data from its data collection system, miscellaneous files, and exports from 		other databases 
	(ii) To do that, it has to consolidate that information and put the data through a cleaner/compiler, with 		the data then being transferred over to a master database for use


Section 2: What dependencies/libraries/packages does it depend on?
-----------------------
import re
	-Works like the "find and replace function"

import pytz
	-This library allows accurate and cross platform timezone calculations using Python 2.4 or higher. It also 		solves the issue of ambiguous times at the end of daylight saving time.

from dateutil.parser import parse
	-The parse method takes a date string (such as "Dec 25, 1995") and returns the number of milliseconds since 		January 1, 1970, 00:00:00 UTC. 
	<-------------?????------------------->
	<---- why this date is absolutely beyond me, multiple sources have this date ---->

from django.db import IntegrityError
	-Gives you an error when your key doesn't work, e.g. a foreign key check fails, duplicate key, etc.

from django.core.exceptions import ImproperlyConfigured
	-The ImproperlyConfigured exception is raised when Django is somehow improperly configured – for example, if 		a value in settings.py is incorrect or unparseable.

from django.contrib.contenttypes.models import ContentType
	-A content type is a reusable collection of metadata (columns), workflow, behavior, and other settings for a 		category of items or documents in a document library.. the skeleton of the data 

from actionkit import ActionKit
	basically allows you to import data from the actionkit library ... python wrapper to allow us to interact 		with the actionkit API... basically the translator  

from progress_crm.adapters.base_adapter import BaseAdapter
	-this is calling on the base_adapter so that you can use the method 

from progress_crm.models import (Person, EmailAddress, PersonEmailAddress,
				PostalAddress, PersonPostalAddress, List,
				ListItem, Donation, Form, Submission)
	-This imports your models from the progress.crm database and puts it in the specified format, as listed.
	



Section 3: What other files within this app does this depend on?
-----------------------------------
e.g. ActionKit draws on BaseAdapter.py so that...

[Fill in this section]





Section 4: What classes does this file define, and what do they do? Does it have methods?
----------------------------------------------
ActionkitAdapter(BaseAdapter) is for ....
Its methods are:
	def __init__: creates a new instance of this class
	def connect is...
[Fill in this section - this will be the longest by far because you want to have an entry for every method.]


Section 5: What functions does this file define (outside of classes), and what do they do? What inputs do they need and what do they return?
--------------------------------------------------
(In this case, all functions are class methods)













