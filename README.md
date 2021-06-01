# seven
How to run Project

1. Download the project zip file from GIT
2. Extract the file and rename the folder with name "seven".
3. copy project folder.
4. Paste inside root directory(for xampp xampp/htdocs, for wamp wampp/www,for lamp var/www/html)
5. Open phpmyadmin (http://localhost/phpmyadmin)
6. Create a database with name "seven".
7. Import seven.sql file(given inside the zip package in sql file folder).


list of end points
1. https://localhost/seven/index.php/api/save_incident
2. https://localhost/seven/index.php/api/get_incident

How to run API(run it on postman)

1. url: https://localhost/seven/index.php/api/get_incident
    method: GET
	response: {
				"data": [
					{
						"id": "1",
						"location": {
							"latitude": "12.92315010",
							"longitude": "74.78185170"
						},
						"title": "incident title",
						"category_id": "1",
						"category": "Security",
						"people": [
							{
								"name": "Name of person",
								"type": "staff"
							},
							{
								"name": "Name of person",
								"type": "witness"
							},
							{
								"name": "Name of person",
								"type": "staff"
							}
						],
						"comments": "This is a string of comments",
						"incidentDate": "2020-09-01 13:26:00",
						"createDate": "2020-09-01 13:32:59",
						"modifyDate": "2020-09-01 13:32:59"
					},
					{
						"id": "2",
						"location": {
							"latitude": "12.92315010",
							"longitude": "74.78185170"
						},
						"title": "incident title",
						"category_id": "1",
						"category": "Security",
						"people": [
							{
								"name": "Name of person",
								"type": "staff"
							},
							{
								"name": "Name of person",
								"type": "witness"
							},
							{
								"name": "Name of person",
								"type": "staff"
							}
						],
						"comments": "This is a string of comments",
						"incidentDate": "2020-09-01 13:26:00",
						"createDate": "2020-09-01 13:32:59",
						"modifyDate": "2020-09-01 13:32:59"
					},
					{
						"id": "3",
						"location": {
							"latitude": "12.92315010",
							"longitude": "74.78185170"
						},
						"title": "incident title",
						"category_id": "1",
						"category": "Security",
						"people": [
							{
								"name": "Name of person",
								"type": "staff"
							},
							{
								"name": "Name of person",
								"type": "witness"
							},
							{
								"name": "Name of person",
								"type": "staff"
							}
						],
						"comments": "This is a string of comments",
						"incidentDate": "2020-09-01 13:26:00",
						"createDate": "2020-09-01 13:32:59",
						"modifyDate": "2020-09-01 13:32:59"
					}
				]
			}
	
2. url: https://localhost/seven/index.php/api/save_incident
    method: POST
	param: select param->body->raw->json
	inside body(provide json data): {
				  "data": [
					{
					  "id": 0,
					  "location": {
						"latitude": 12.9231501,
						"longitude": 74.7818517
					  },
					  "title": "incident title",
					  "category": 1,
					  "people": [
						{
						  "name": "Name of person",
						  "type": "staff"
						},
						{
						  "name": "Name of person",
						  "type": "witness"
						},
						{
						  "name": "Name of person",
						  "type": "staff"
						}
					  ],
					  "comments": "This is a string of comments",
					  "incidentDate": "2020-09-01T13:26:00+00:00",
					  "createDate": "2020-09-01T13:32:59+01:00",
					  "modifyDate": "2020-09-01T13:32:59+01:00"
					}
				  ]
				}