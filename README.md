# README
Good nigth api 
Requirement and tech doc : https://docs.google.com/document/d/1lAScOHghlSRXzyJTPjoY-ydaEHOFDZaeDADFY62QVwI


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  Ruby 3.2.2
  
* System dependencies
  Rails 8.0.2
  MongoDB
  Docker
  
* Configuration
  no specific config
  
* Database initialization
  Run Seeds in DB folder ‘Rails db:seed’
  Run docker
 
* How to run the test suite
  
  
* Services (job queues, cache servers, search engines, etc.)
  -
  
* Deployment instructions
  Install Docker
  Clone repository
  Bundle install on repository
  Check running with Rails S / Rails C
  Run Seeds in DB folder ‘Rails db:seed’
  Export postman from source code (for testing purpose)
  Run ‘docker compose up’
  Check user data after seeding in database with Rails C
        User.all.to_A : to check all user in database and for copy id for testing in postman
  Copy user id as params for testing in postman
  

