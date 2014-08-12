NOI Meeting Notes

Why this project: Having issues to get tools to talk to each other, create something that would communicate, to expand the functionality. FInd easy way to run queries.

Users: 18million Rising(Actionkit), UWD(Salsa-mobile ?)Bread(salesforce- Flexible, identify needs for businesses, identify potential donors )

Overview: core infrastructure has been create database and adaptors and set of classes that can be expanded. 
Actionkit - keeps track of  email and donation(18m) adapter has been created 
2 prototype apps exists: 
stats app measures data and how many users, show size of list
geogrphic breakdown

Goal: To have the Reporter app run queries without the user knowing SQL

Pull in data and clean it up(sync)(in and out)
Organizations use different databases 
Uses the Django admin 
Need data in one Place 
Social input to see facebook friends

Who will use this app?
In between its for the data manager some may know sql (any developer)
If UWD and 18M not able to get together then we can use other orgs that we are collaborating with like Bread for the City or OTI

Communication: 
Code for Progress will communicate with us about what Bread for the City team will be working on.
NOI is communicating with UWD and 18m to set up meeting with Team NOI

DATABASE: 
Sandbox and populate them (this means to create a fake account and repopulate them to allow us to work with that information to make sure it works.)
Models - the core models are in the presentation the rest of the information is in the repository.


 Challenges
Regular folk (user-friendly)
Sales force adapter
Find a way to easily import csv files 
OSDI open supported data interface 


PROCESS: 
Meet: Once a week (Trello for task management/Email)
Spanish Documentation (django supports multiple languages Spanish interface)
Style and design ( we can design) (user interface )
Code testing user feedback testing
	-test functionalities begin with models
	-every app will need testing 

Support-  email tim or shannon 
Shannon will use lunch breaks, morning, after work to teach new code

Security
No credentials on the source code
Know Django authorization tools no 
creating accounts for people directly
user interface for organization members- potentially verify email

What are some deliverables this week?
1. User stories
2. Wireframes
3. Meet with data managers

What are we building?
salsa adapter 
report app interface

Next steps 
Week 1 Sprint  
1. Understanding the code  (20hrs to build salsa adapter) 
2. user stories and wireframes (EDM)
3.Sandbox account Salesforce and Salsa (NOI)
4.Send map of all the data models (Tim)
5.Detail run through code ( need to schedule a date)(EMD and NOI)
6.Meet with data managers (NOI)
7. Gain acces to Repository(fork in individual accounts) (Tim)
8. Add Tim and Shannon to Trello (Mariella)
9. Send follow up email with notes and next steps (Elaine)
10. Set up a weekly meeting with Aliya (Dago) 
11. Create shared team NOI calendar add Tim and Shannon 
12. Connect with Code Bread on shared functionality (Aliya & Dirk) 
13. Update Trello (Mariella )