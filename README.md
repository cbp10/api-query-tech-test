# Tech Test

This is a tech test based on producing an app that can answer some questions about data held in a public API.

## How to run the app

### Install
```
$ git clone https://github.com/cbp10/api-query-tech-test
$ cd api-query-tech-test
$ bundle install
```

### Test
```
$ rspec
```

### Run
```
$ ruby app.rb COMMAND PARAMETERS
```
The script accepts one parameter to specify the question it will answer, and in some cases an optional argument. 

The following questions have been implemented: 
* `most_sold`: What is the name of the most sold item?
* `total_spend [EMAIL]`: What is the total spend of the user with this email address [EMAIL]?
* `most_loyal`: What is the email address of the most loyal user (the person with the most number of items
bought)?

e.g
```
$ ruby app.rb most_loyal
"travis_kshlerin@wunsch.net"
```

## Approach

The app is written in Ruby, with Rspec used for testing. I followed the TDD approach to implement each of the questions, and have 100% test coverage.


## Structure

command line (user enters question)
	|
	|
	|
   App.rb (handles question from command line by calling correct method in Question class) 
   		|
   		|
   		|
   		------- Question class (handles logic for data retrieved for api call)
   					|
   					|
   					|
   					APICall class (makes api call and returns data to Question class)


### Plan

* Check the data being returned from the API
* Investigate passing parameters through the command line
* Follow TDD to implement each question/feature
* Complete Readme

### Improvements

* The naming of variables and methods may not be as clear as they could be, as they were first written for a specific need and then refactored to make it more generic to be reused, but more time to plan would have been helpful here.
* I haven't considered how to handle no response from the API





