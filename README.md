
### [Makers Academy](http://www.makersacademy.com) - Week 6 Group Project

# Makers BnB
-

[Outline](#Outline) | [Task](#Task) | [Installation Instructions](#Installation) | [Feature Tests](#Feature_Tests) | [User Stories](#Story) | [Objects & Methods](#Methods) |


## <a name="Outline">Outline</a>
 
Week long group challenge to build a Airbnb clone

## <a name="Task">The Task</a>


## <a name="Installation">Installation Instructions</a>

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


## <a name="Feature_Tests">Feature Tests (How it works)</a>

To run the tests type the following into the terminal

````
$ rspec
````


## <a name="Story">User Stories</a>

```
STRAIGHT UP

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

HARDER

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep.
```


## <a name="Methods">Objects & Methods</a>
-


### Object


| Methods        | Description                                            |
|----------------|--------------------------------------------------------|
| | |
  




## User Stories

### MVP

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
