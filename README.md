# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

## Prerequisites

You need to install all of this before moving to next step.

* [Git](http://git-scm.com/)
* [Ruby](https://www.ruby-lang.org/en/downloads/) (version 2.5.1 or higher)
* [MySQL](https://dev.mysql.com/downloads/)

## Installation 

1. Clone repo: `git clone git@gitlab-new.bap.jp:Travel-Matching/API.git`
2. Move to project: `cd API`
3. Install gem: `bundle install`
4. Make sure you are able to access MySQL without root password: `mysql -u root`
5. Setup database: `rails db:create && rails db:migrate`
6. Generate api documentation; `rails swagger:docs`
7. Start server: `rails server` 

Now, API server should be running on [http://localhost:3000/docs](http://localhost:3000/docs)

**IMPORTANT!** 

Setup local environment variable. This is MUST, because the project need these variable to config & run properly.
You can also keep any sensitive information here.
 - Move to project root folder `cd api`
 - Create local database file using sample file `cp config/database.yml.sample config/database.yml`
 - Create local environment file using sample file `cp config/application.yml.sample config/application.yml`
 - Modify it to fit with you `nano config/appliation.yml`

  ```bash
    DATABASE_HOSTNAME: <Host>
    DATABASE_NAME: <Database name>
    DATABASE_USERNAME: <User name mysql>
    DATABASE_PASSWORD: <Password mysql>
    ...
  ```

## API Documentations
- The documentation will be auto-generate by swagger-docs after running `rails swagger:docs`. In case of you want to
    refer API doc, follow the simple instruction in 
  [Swagger-Docs](https://github.com/richhollis/swagger-docs)

* ...
