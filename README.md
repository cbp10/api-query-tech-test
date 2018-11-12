# Tech Test

This is a tech test based on producing an app that can answer some questions about data held in a public API.

## How to run the app

### Install
```
clone this repo
cd tech-test
bundle install
```

### Test
```
rspec
```

### Run
```
ruby app.rb COMMAND PARAMETERS
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



