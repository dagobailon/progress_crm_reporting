ActionKit Adapter Deep Read memo
==================================

Section 1: What does this code DO?
----------------------------------
Try to explain in as clear language as possible:
- One sentence: the overall purpose of the code is connect ActionKit CRM, pull in the data sets, convert, clean up and transfer the data to ProgressCRM. 

Overall fuction step by step 
The connection is made through using the ActionKit API with access requirements such as organization's URL, username and password. 
Only at a rate of 100 entries at a time. Next the methods "get_people" or "get_event" makes the request to import JSON objects from ActionKit data models, data then goes through a matching process and uses the string method of .format to convert objects like person identifies ie 'id' from ActionKit to ProgressCRM. Each method processes each entry by checking if the object already exists in ProgressCRM and if not to create that entry and saves. 


For example, 

(i) The ActionKit adapter takes data....
(ii) To do that, it has to:
- Be able to import, as JSON, data from one ActionKit SQL database
[Fill in this section]


Section 2: What dependencies/libraries/packages does it depend on?
-----------------------
(Otherwise known as: What are all those imports at the top of the file? What's dateutil.parser import parse? What's the ActionKit library?)

[Fill in this section]


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













