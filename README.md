
### [Makers Academy](http://www.makersacademy.com) - Week 6 Group Project

# Makers BnB
-

[Outline](#Outline) | [Task](#the-task) | [Installation Instructions](#installation-instructions) | [Testing](#testing) | [User Stories](#user-stories) | 


## Outline
 
Week long group challenge to build an Airbnb website clone

## The Task

## The Team

Tuan Nguyen
Sam Folorunsho
Andrea Di
Andrew Bacon

## Features

* user sign up (validation on unique email adresses)
* user sign in
* password encryption
* user sign out
* list space
* viewing all available spaces
* request space
* space owner booking confirmation
* space owner booking rejection
* Greyed out calendar dates that are unavailable



## Installation Instructions

Clone the repository from github then change directory into it.

Load dependencies with bundle.
```
$ gem install bundle
$ bundle
```

In order to run the feature tests, Firefox and Firefox GeckoDriver are required. To install these, run the following commands:

```
$ brew cask install firefox
$ brew install geckodriver
```


### To set up the database

Access to the database is controlled by an ORM, ActiveRecord. To migrate the development and test databases/tables please run the following command:

```
$ rack db:create
```

To poplulate the databases with the appropriate tables, run the following migrations:

```
$ rack db:migrate
$ rack db:migrate RACK_ENV=test
```


### To run the MakersBnB app:

```
$ rackup
```


To view sign-up page, navigate to `localhost:9292/`.


## Testing

The main focus of the team was to fully feature test the app. Unit tests were added where model functionality was required beyond that provided by inherited Gems. To run the tests, run rspec within the terminal 

````
$ rspec
````

## Technologies used

 * Ruby
 * Sinatra
 * Capybara
 * Rspec
 * HTML
 * CSS
 * Bootstrap
 * JQuery / Ajax
 * ActiveRecord
 * PostgreSQL

## User Stories

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

### Stretch

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


