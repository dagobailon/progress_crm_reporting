ProgressCRM Transition Memo:
============================

This memo is a project overview of the reporting application for ProgressCRM built by Code For Progress fellows Dago Bailon, Elaine Kamlley and Mariella Paulino. Below are key points that documents what features were completed, what features are in process, and finally what needs to be worked on in the future. 

Executive Summary
------------------

The CFP team worked on front end features and backend functionality for the following: the reporting application has the ability to connect to SQL and execute queries. The queries results are formatted on a table as a preview. It then has a feature that allows the user to export the results to a csv.


What features were completed?
-----------------------------

Frontend: 
Admin page were registered to include areas to submit data points
Export to CSV button is functional and downloads a csv to your computer
Report buttons are connected to queries that redirects to results page with formatted tables. 
Go back button is function and renders the index.html 

Backend: 
urls connect the pathway to class based views using ids
Within the Class-based views we are able query using rawSQL and returning results from data stored in the application's models
html files incorporates django language to be able to display query results and back end functionality 
Registered the models to admin interface


What features are in process?
-----------------------------
Documentation - Commenting the code and updating read me file to accurately descrip reporting feature

What needs to be worked on? 
---------------------------
Scalability: How will this system handle large sets of data, using SQL queries?
Help feature - that connects to a FAQ
