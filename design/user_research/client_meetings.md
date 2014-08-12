Client Meetings Executive Summary
==================================

These meetings were conducted to obtain end user requirements. Below is the outline of the agenda and corresponding notes for each meeting. 

The primary goal for these meetings is to obtain the necessary requirements for ProgressCRM. Many of the these individuals we interviewed hold positions that manage data that track their impact with the communitites they serve. 

Challenges: 
-----------
	- A few organizations felt like the CRMs platform had multiple fuctions that were not useful and crowded the screen.
	-There are no current capabilities to track social media preanswer a questions:
	 	What platform do the constituents move to action from? 
	 	Are their online members continuing to repost articles or take action 	
	- Fragmented tracking of events. In action kit, there is a separation between the count of how many people RSVPed for an event to how many attended. 

Needs: 
------
	-Users have a high demand for a simple platform that can cross connect a person to many interactions on various CRMs. 
	-Deeper collection of Social Media engagement. 
	-User friendly reporting feature. 
	
Agenda:
=======
Intros (5 mins) 
Goals:
	Better understanding daily use of the CRM
	Document challenges
	Document feature needs

A Day in the Life (30 mins)  
	What is your role in the organization you serve?
	How do you collect information?
	What CRMs do you use?
	What are the top five reports you are ask for a week?
	What are some typical reports you generate?
	DEMO: 
		Can you show us how you generate those reports?
		How do you use the dashboard?

The Mountain Ahead: (10 mins) 
	What are the primary challenges you face? 
	What are the most un-user friendly aspects of this CRM? 

Hopes and Dreams: (10 mins) 
	If you could build it, what would it have? 
	How would you change it to be more user friendly?
Notes:
======

New Organizing Institute
------------------------
Date: 7/18/2014

Attendees:
	Anupamu - Data Manager NOI
	Dago
	Mariella
	Elaine

Roles: 
	Elaine - Facilitating
	Dago & Mariella - Notes

Main functions of db manager:
	Find out what data we have, what data we need, where the data is stored
	Providing support to communications team by writing queries for them 
	communication team requests things from them like 
	idenitfy everyone in actionkit who has attended an event 
	NOI ha sbeen using ActionKit since 2010(person table core user)
	NOI Query to invite people to the NOI NETROOTS Party
	NOI is using the commands in SQL and then pasting the commands into the NOI interface to do searches and generate reports 
	The NOI interface does not do joins, and so the db manager prefers doing the queries in SQL	
ActionKit is for communicating with people as part of a large group
	you do not address them individually 
Salesforce is for anything involving money 
	donations 
	anytime they pay a trainer 
	data about trainings 
		when people buy tickets to trainings 

Challenges in ActionKIT
	when you import people you must associate them with a page 
	a signup page for training 
	a donation page 
	a dummy page 
	you need to create multiple pages for who rsvp versus who actually attended … the only way to link them is to have a naming convention 
	way too many things are called pages 
	if you create a report in actionkit and you want to retrieve the user and mark it as something you cannot mark something 
	if 4 people have signed up to an event… but only 2 went,… you want to be able to identify people in the table without having to create a whole new page who went without having to create a whole new table… too many pages! 
	you want to create more information in one page without having to create new pages
	WANT ALL THE INTERACTION WITH ONE EVENT FOR ONE USER 

Top Reports:
	1. Retrieves IDs of subscribed AlumNOI who have been to an in-person event/training per naming conventions described here: https://docs.google.com/a/neworganizing.com/document/d/11SoWscJH4hxPru7JlcergpK5Pd_qBPuU1wEfgEsi5sk/edit :

	SELECT core_user.id
	FROM core_user
	JOIN core_action
	ON (core_user.id = core_action.user_id)
	JOIN core_page
	ON (core_action.page_id=core_page.id)
	WHERE core_user.subscription_status = 'subscribed'
	AND (core_page.title LIKE 'NMT%' COLLATE utf8_bin
	OR core_page.title LIKE 'DBC%' COLLATE utf8_bin
	OR core_page.title LIKE 'DT%' COLLATE utf8_bin
	OR core_page.title LIKE 'HH%' COLLATE utf8_bin
	OR core_page.title LIKE 'Labs%' COLLATE utf8_bin
	OR core_page.title LIKE 'MBT%' COLLATE utf8_bin
	OR core_page.title LIKE 'NMBC%' COLLATE utf8_bin
	OR core_page.title LIKE 'NMT%' COLLATE utf8_bin
	OR core_page.title LIKE 'NOD%' COLLATE utf8_bin
	OR core_page.title LIKE 'NOF%' COLLATE utf8_bin
	OR core_page.title LIKE 'NOISE%' COLLATE utf8_bin
	OR core_page.title LIKE 'RC%' COLLATE utf8_bin
	OR core_page.title LIKE 'SRC%' COLLATE utf8_bin)

	2. Count of Bounced Emails By Page of Origin - AP

	Retrieves the number of users with a subscription status of "bounced" grouped by the page from which the user originated

	SELECT COUNT(DISTINCT ca.user_id), ca.page_id, cp.title, cp.name
	FROM core_action AS ca
	JOIN core_user AS cu
	ON ca.user_id = cu.id
	JOIN core_subscriptionhistory as csh
	ON cu.id=csh.user_id
	JOIN core_page as cp
	ON ca.page_id = cp.id
	WHERE ca.created_user
	AND ca.subscribed_user
	AND cu.subscription_status = 'bounced'
	AND csh.updated_at BETWEEN CURDATE() - INTERVAL 30 DAY AND CURDATE()
	GROUP BY page_id;

	3. Users - No Email Opens In Past 6 Months - AP 

	Retrieves users who have not opened an email in the past two years

	SELECT cu.id, cu.first_name, cu.last_name, cu.email, cu.created_at, cu.subscription_status
	FROM core_user cu
	WHERE cu.subscription_status = 'subscribed'
	AND NOT EXISTS (
	SELECT co.user_id 
	FROM core_open co
	WHERE co.created_at > CURDATE() - INTERVAL 6 MONTH
	AND co.user_id = cu.id
	);

	4. Users - No Email Opens In Past 1 Year - AP

	Retrieves users who have not opened an email in the past year

	SELECT cu.id, cu.first_name, cu.last_name, cu.email, cu.created_at, cu.subscription_status
	FROM core_user cu
	WHERE cu.subscription_status = 'subscribed'
	AND NOT EXISTS (
	SELECT co.user_id 
	FROM core_open co
	WHERE co.created_at > CURDATE() - INTERVAL 1 YEAR
	AND co.user_id = cu.id
	);

	5. Users - No Email Opens In Past 2 Years - AP

	Retrieves users who have not opened an email in the past two years

	SELECT cu.id, cu.first_name, cu.last_name, cu.email, cu.created_at, cu.subscription_status
	FROM core_user cu
	WHERE cu.subscription_status = 'subscribed'
	AND NOT EXISTS (
	SELECT co.user_id 
	FROM core_open co
	WHERE co.created_at > CURDATE() - INTERVAL 2 YEAR
	AND co.user_id = cu.id
	);


18 Million Rising
-----------------
Date: 7/18/2014

Attendees:
	Cayden
	Dago
	Mariella
	Elaine

Roles: 
	Elaine - Facilitating
	Dago & Mariella - Notes

18MR work
	Immigration
	cultural work
	civic engagement
	Unique online work(young people don’t use email that much - Use social media)


Day in the life
	ActionKit now moving to Action NetWork
	Run petition every week 
	Social Media 
	List size 17,000

The Mountain Ahead
	Delivery report pain and hard to print(can drop html/css to format)
	Formatting not good 
	First clean data then formatting
	emailing pdf is hard
	Tracking in analytics are done in django backend
	Sharetrack - creates report automatic and charts
	-Tracks by email id through  actionkit ID
	-Returning action member helps to tell the org what campaign resonate with the people
	-How do we incorporate social media users?
	- User interface for action network user friendly 
	-robust api
	- only one data base CRM
	- will there be a way to integrate social media in database to track them
	- How to track non petition actions(sharing, tweets)

Dreams and Hopes
	- showdow social network 
	- something that allow us to see the density of our network 
	- where new ppl are being drawn in 

Top Reports generated:
	The things I usually end up writing some SQL off the cuff for are users who have signed the petition in the last 24 hours, which might be great to have at your fingertips.

	It'd also be great to have a report on hand that shows you the number of users who have taken an action that wasn't their first in the past week and the past month.


United We Dream
----------------

7/22/2013
Attendance: 
	Adrian - Technology and Data Manager
	Dago
	Mariella
	Elaine

Adrian has been working with UDW for 2 1/2 years 


Salsa - All of online commuications
	email
	sign up (news letters, action alerts, event)

NGP VAN - access data for on the ground organizers
	event attendance
	track levels of engagement
	Take data from Salsa, process data through a PostgresSQL to match with address name, then connect them with VAN and categorize activist, prospect (sign petitions but not to an event), level 1.  

Challenges: 
	Getting people to report back
		Have people log into VAN and schedule the event
	Developed a standard data collection  - Quickbase
	Mobile Commons SMS system - its siloed and not connected to any other system
		Its a stand alone system and has not been used to its full capabilities, only using it to send alerts. 
	Cleaning data is a strugggle, particularly duplicates  
	Having the entire family under one email 
		especially when you match that 
	having one person attached to 5 emails or phone numbers or people. a kind of family connectivity within one person 
	Salsa sucks on the backend (?) 
		it has no rules 
		there is little validation 
		there is no stoppage… so for phone number there are no limits… everything is a string
		there is no direction 
		There is a problem on of date format. Mobile commons exports dates DD-MM-YYY and salsa only accepts MM-DD-YYY. Its a manual process to adjust the dates. Major issue
	Even as a seasoned db, he finds himself struggling with trying to understand the syntax 
	When the syntax is a huge barrier to making the data open, then it defeats the purpose of the 
	organization being open source and available to help its public 
	Generate the graphs from the Salsa mainframe as opposed to coding them in 
	Salsa will search a term from where the user came from up. 
		Salsa will just capture the link 

TOP 5 REPORTS
	Are people taking action from online email 
	Produce user reports 
	Number of people engage online liked signed petition or RSVPed for an event
	How many people attended an events
	Which organizers signed up which people 
	Export full list
	Mobile commons has a good interface 