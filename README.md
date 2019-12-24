
### [Makers Academy](http://www.makersacademy.com) - Week 6 Group Project

# Makers BnB

[Application Summary](#application-summary) |[The Team](#the-team) |[Features](#features) | [Getting Started](#getting-started) | [Testing](#testing) | [Screenshots](#screenshots) |[User Stories](#user-stories) | 


## Application Summary

MakersBnB is an online platfrom for listing short-term lets. Renters can view the available spaces and send the host a request to book. The host can then choose to accept or decline the request.

It was developed as part of the group project in week 6 of the Makers Bootcamp.

## The Team

[Tuan Nguyen](https://github.com/TuanNguyen1010)
[Sam Folorunsho](https://github.com/samfolo)
[Andrea Diotallevi](https://github.com/AndreaDiotallevi)
[Andrew Bacon](https://github.com/ajbacon)

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



## Getting Started

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


### Database Setup

Access to the database is controlled by an ORM, ActiveRecord. ActiveRecord rake tasks will are used to migrate the development and test databases. 

To migrate the development and test databases, please run the following command:

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

The main focus of the team was to fully test all features within the application. Unit tests were added where model functionality was required beyond that provided by inherited Gems. To run the tests, run rspec within the terminal.

````
$ rspec
````

## Screenshots

## Technologies used

The following technologies were used to develop the application:

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

MakersBnB was developed based on the following user stories

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


