# MakersBnB

[Description](#description) | [Live Demo](#live-demo) | [The Team](#the-team) | [Challenges and Goals](#challenges-and-goals) | [Features](#features) | [User Stories](#user-stories) | [Getting Started](#getting-started) | [Database Setup](#database-setup) | [How to Run the Tests](#how-to-run-the-tests) | [How to Run the App](#how-to-run-the-app) | [Technologies Used](#technologies-used) | [Code Quality](#code-quality) | [Continuous Integration](#continuous-integration) | [Relational Database Associations](#relational-database-associations)

## Description

A full-stack web application in Ruby on Sinatra for listing short-term lets. Renters can view the available spaces and send the host a request to book. The host can then choose to accept or decline the request.

## Live Demo

The application is deployed to Heroku at this link: [https://makers-bnb-sinatra.herokuapp.com/](https://makers-bnb-sinatra.herokuapp.com/)

## The Team

This was a group project during week 6 of [Makers Academy](https://makers.tech/). The team was composed by:

* [Tuan Nguyen](https://github.com/TuanNguyen1010)
* [Sam Folorunsho](https://github.com/samfolo)
* [Andrea Diotallevi](https://github.com/AndreaDiotallevi)
* [Andrew Bacon](https://github.com/ajbacon)

## Challenges and Goals

* Build a full-stack web application to simulate the [Airbnb](https://www.airbnb.co.uk/) website
* Build a MVC application following conventional design patterns
* Design relational database associations and RESTful routes
* Write SQL-like queries through an Object-Relational Mapping system like Active Record within a MVC application
* Build a fully-tested application with 100% test coverage

## Features

* Sign up (validation on unique email adresses)
* Sign in
* Password encryption
* Sign out
* List space
* View all available spaces
* Request space
* Space owner book confirmation
* Space owner book rejection
* Greyed out calendar dates that are unavailable

## User Stories

MakersBnB was developed based on the following user stories.

### Minimum Viable Product

```
As a user
So that I can book or host spaces
I want to be able to sign up 

As a user
So I can have access to the site and its features
I want to be able to sign in

As a host
So I can advertise a space
I want to be able to list a space

As a host
So I can advertise more than one space
I want to be able to list multiple spaces

As a host
So that I can provide more details on a space
I want to be able to include a name, price per night and description with my listing

As a user
So that I can plan my travel
I want to be able to request a space for one night
```

### Stretch Goals

```
As a user
So that no one else can use my profile
I want to be able to sign out

As a host
So that I can let the user know when the space is available
I want to be able to specify a range of dates

As a host
So that I can rent out a space
I want to be able to accept a request

As a user
So that I can avoid dissapointment
I should not be able to book unavailable spaces

As a user
Until a request has been accepted
I want to still be able to put in an offer for a space
```

## Getting Started

* Clone the repository from github then change directory into it.
* Load dependencies with bundle:
  ```
  $ gem install bundle
  $ bundle
  ```
* In order to run the feature tests, Firefox and Firefox GeckoDriver are required. To install these, run the following commands:
  ```
  $ brew cask install firefox
  $ brew install geckodriver
  ```

## Database Setup

* Access to the database is controlled by an ORM, ActiveRecord. ActiveRecord rake tasks which are used to migrate the development and test databases. 
* To migrate the development and test databases, please run the following command:
  ```
  $ rake db:create
  ```
* To poplulate the databases with the appropriate tables, run the following migrations:
  ```
  $ rake db:migrate
  $ rake db:migrate RACK_ENV=test
  ```
  
## How to Run the Tests
  
The main focus of the team was to fully test all features within the application. Unit tests were added where model functionality was required beyond that provided by inherited Gems. To run the tests, run ```rspec``` within the terminal.

## How to Run the App

To view the sign-up page, type ```rackup``` and navigate to ```localhost:9292```

## Technologies Used

The following technologies were used to develop the application:

* Main technologies:
  - Ruby
  - Sinatra
  - ActiveRecord
  - PostgreSQL
  - JQuery / Ajax
  - Bootstrap
  - HTML
  - CSS
  
* Testing frameworks:
  - RSpec
  - Capybara
  - Selenium WebDriver
  
## Code Quality

To run the linter type ```rubocop```

## Continuous Integration

[TravisCI](https://travis-ci.com/) has been use for continuous integration and automatic deployment to [Heroku](https://dashboard.heroku.com).

## Relational Database Associations

| Users      | Spaces          | Requests       |
| ---------- | --------------- | -------------- |
| id         | id              | id             |
| email      | user_id         | user_id        |
| password   | name            | space_id       |
|            | description     | date_requested |
|            | price_per_night | status         |
|            | available_from  |                |
|            | available_to    |                |
