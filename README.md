Folksonomatron
==============

Folksonomatron is a sinatra webservice: give it a URL and get back tags from delicious in JSON format.

Eventually I hope to fetch tags from other socials sites too.


To Do
-----

- Switch from scraping to API-hitting
- Set up heroku workers to pick off the jobs
- set up heroku config vars
- curl https://sikelianos:MYPASSWORD@api.del.icio.us/v1/posts/suggest?url=http://yahoo.com/