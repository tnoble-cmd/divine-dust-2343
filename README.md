# Field Trip

This repository requires and has been tested on Ruby v3.2.2 and is based on Rails 7.1.3.

**RSpec** and **Shoulda-Matchers** have been installed and set up.

## Setup

1. fork this repo
2. clone your fork
3. `git clone <repo_name>`
4. `cd <repo_name>`
5. `bundle install`
6. `rails db:{drop,create,migrate,seed}`

When you run `bundle exec rspec` you should have 2 passing tests.

## Instructions

* Work on this assessment independently. DO NOT discuss with anyone.
* You are allowed to use any references including notes, Google, lesson plans, etc.
* Read each story carefully before you start working.
* Commit Frequently, about every 15 - 30 minutes
* Push your code to your fork **once the time is up (not before!)**

## Submission

**Once the time for the assessment is up**, push your code to your fork and create a pull request to the `turingschool-examples` repository. Include the following:

* Your Name
* A reflection on how you felt you did with this challenge and what story you got through

## Requirements

* TDD all new work
* model methods and relationships must be fully tested.

## Not Required

* No visual styling is required or expected
* You do not need to test for or create any model validations.

## Description

Field Trip is an app that allows a user to see airlines, flights, and passengers. Make sure to read all instructions, tasks, and user stories before getting started.

## Database information

* Airlines have a name
  * Ex: name: “Frontier”
* Flights have a number, date, departure city, and arrival city
  * Ex: number: “1727”, date: “08/03/20”, departure_city: “Denver”, arrival_city: “Reno”
  * For this app, it does not matter how you format the flight’s date
* Passengers have a name and age
  * Ex: name: “Joe”, age: 7
* Airlines have many flights
* Flights belong to an airline
* Flights have many passengers
* Passengers can have many flights

Some of the initial migrations and model set up has been done for you.

## User Stories

```
User Story 1, Flights Index Page

As a visitor
When I visit the flights index page
I see a list of all flight numbers
And next to each flight number I see the name of the Airline of that flight
And under each flight number I see the names of all that flight's passengers
```

```
User Story 2, Remove a Passenger from a Flight

As a visitor
When I visit the flights index page
Next to each passengers name
I see a link or button to remove that passenger from that flight
When I click on that link/button
I'm returned to the flights index page
And I no longer see that passenger listed under that flight,
And I still see the passenger listed under the other flights they were assigned to.
```

```
User Story 3, Airline's Passengers

As a visitor
When I visit an airline's show page
Then I see a list of passengers that have flights on that airline
And I see that this list is unique (no duplicate passengers)
And I see that this list only includes adult passengers.

(Note: an adult is anyone with age greater than or equal to 18)
```

## Extensions

```
Extension, Frequent Flyers

As a visitor
When I visit an airline's show page,
Then I see that the list of adult passengers is sorted
by the number of flights each passenger has taken on the airline from most to least

(Note: you should only make 1 database query to retrieve the sorted list of passengers)
```
