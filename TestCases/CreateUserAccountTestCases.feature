# Created by User at 8/7/2024
Feature: User Registration

  Scenario: Successfully create a new user account
    Given the user is on the registration page
    When the user enters a first name "John"
    And the user enters a last name "Doe"
    And the user enters a date of birth "01/01/1990"
    And the user enters an email "john.doe@example.com"
    And the user re-enters the email "john.doe@example.com"
    And the user enters a password "password123"
    And the user checks the terms and conditions checkbox
    And the user clicks the "Register" button
    Then the user should be redirected to the account activation page
    And the user should receive an email with an activation link

  Scenario: Email already registered
    Given the user is on the registration page
    When the user enters a first name "Jane"
    And the user enters a last name "Smith"
    And the user enters a date of birth "02/02/1992"
    And the user enters an email "jane.smith@example.com"
    And the user re-enters the email "jane.smith@example.com"
    And the user enters a password "password123"
    And the user checks the terms and conditions checkbox
    And the user clicks the "Register" button
    Then the user should be redirected to the login page
    And the user should see a message "There is an existing account associated with jane.smith@example.com"

  Scenario: Invalid email format
    Given the user is on the registration page
    When the user enters a first name "Alice"
    And the user enters a last name "Brown"
    And the user enters a date of birth "03/03/1993"
    And the user enters an email "alice.brown"
    And the user re-enters the email "alice.brown"
    And the user enters a password "password123"
    And the user checks the terms and conditions checkbox
    And the user clicks the "Register" button
    Then the user should see an error message "Invalid email." below the email text box


  Scenario: Date of birth exceeds current date
    Given the user is on the registration page
    When the user enters a first name "Chris"
    And the user enters a last name "Evans"
    And the user enters a date of birth "01/01/2100"
    And the user enters an email "chris.evans@example.com"
    And the user re-enters the email "chris.evans@example.com"
    And the user enters a password "password123"
    And the user checks the terms and conditions checkbox
    And the user clicks the "Register" button
    Then the user should see an error message "Selected date exceeds the current date."

  Scenario: Successful account activation in the same browser
    Given the user has registered and received an activation email
    When the user clicks on the activation link in the same browser
    Then the user should be automatically logged in to the system

  Scenario: Successful account activation in a different browser
    Given the user has registered and received an activation email
    When the user clicks on the activation link in a different browser
    Then the user should be redirected to the login page
    And the user should see a welcome message with the email address pre-populated

  Scenario: First name is too short
    Given the user is on the registration page
    When the user enters a first name "Jon"
    And the user enters a last name "Doe"
    And the user enters a date of birth "01/01/1990"
    And the user enters an email "john.doe@example.com"
    And the user re-enters the email "john.doe@example.com"
    And the user enters a password "password123"
    And the user checks the terms and conditions checkbox
    And the user clicks the "Register" button
    Then the user should see an error message "First Name must be between 4 and 150 characters."

  Scenario: First name is too long
    Given the user is on the registration page
    When the user enters a first name "<150+ characters>"
    And the user enters a last name "Doe"
    And the user enters a date of birth "01/01/1990"
    And the user enters an email "john.doe@example.com"
    And the user re-enters the email "john.doe@example.com"
    And the user enters a password "password123"
    And the user checks the terms and conditions checkbox
    And the user clicks the "Register" button
    Then the user should see an error message "First Name must be between 4 and 150 characters."

  Scenario: Last name is too short
    Given the user is on the registration page
    When the user enters a first name "John"
    And the user enters a last name "Li"
    And the user enters a date of birth "01/01/1990"
    And the user enters an email "john.doe@example.com"
    And the user re-enters the email "john.doe@example.com"
    And the user enters a password "password123"
    And the user checks the terms and conditions checkbox
    And the user clicks the "Register" button
    Then the user should see an error message "Last Name must be between 4 and 150 characters."

  Scenario: Last name is too long
    Given the user is on the registration page
    When the user enters a first name "John"
    And the user enters a last name "<150+ characters>"
    And the user enters a date of birth "01/01/1990"
    And the user enters an email "john.doe@example.com"
    And the user re-enters the email "john.doe@example.com"
    And the user enters a password "password123"
    And the user checks the terms and conditions checkbox
    And the user clicks the "Register" button
    Then the user should see an error message "Last Name must be between 4 and 150 characters."

  Scenario: Email is too long
    Given the user is on the registration page
    When the user enters a first name "John"
    And the user enters a last name "Doe"
    And the user enters a date of birth "01/01/1990"
    And the user enters an email "<150+ characters>@example.com"
    And the user re-enters the email "<150+ characters>@example.com"
    And the user enters a password "password123"
    And the user checks the terms and conditions checkbox
    And the user clicks the "Register" button
    Then the user should see an error message "Email must be no longer than 150 characters."

  Scenario: Password is too short
    Given the user is on the registration page
    When the user enters a first name "John"
    And the user enters a last name "Doe"
    And the user enters a date of birth "01/01/1990"
    And the user enters an email "john.doe@example.com"
    And the user re-enters the email "john.doe@example.com"
    And the user enters a password "12345"
    And the user checks the terms and conditions checkbox
    And the user clicks the "Register" button
    Then the user should see an error message "Password must be between 6 and 20 characters."

  Scenario: Password is too long
    Given the user is on the registration page
    When the user enters a first name "John"
    And the user enters a last name "Doe"
    And the user enters a date of birth "01/01/1990"
    And the user enters an email "john.doe@example.com"
    And the user re-enters the email "john.doe@example.com"
    And the user enters a password "<21+ characters>"
    And the user checks the terms and conditions checkbox
    And the user clicks the "Register" button
    Then the user should see an error message "Password must be between 6 and 20 characters."

  Scenario: Terms and conditions not checked
    Given the user is on the registration page
    When the user enters a first name "John"
    And the user enters a last name "Doe"
    And the user enters a date of birth "01/01/1990"
    And the user enters an email "john.doe@example.com"
    And the user re-enters the email "john.doe@example.com"
    And the user enters a password "password123"
    And the user does not check the terms and conditions checkbox
    And the user clicks the "Register" button
    Then the user should see an error message "You must agree to the terms and conditions."

  Scenario: First name not filled
    Given the user is on the registration page
    When the user leaves the first name field empty
    And the user enters a last name "Doe"
    And the user enters a date of birth "01/01/1990"
    And the user enters an email "john.doe@example.com"
    And the user re-enters the email "john.doe@example.com"
    And the user enters a password "password123"
    And the user checks the terms and conditions checkbox
    And the user clicks the "Register" button
    Then the user should see an error message "Please fill in this First Name" below the first name text box

  Scenario: Last name not filled
    Given the user is on the registration page
    When the user enters a first name "John"
    And the user leaves the last name field empty
    And the user enters a date of birth "01/01/1990"
    And the user enters an email "john.doe@example.com"
    And the user re-enters the email "john.doe@example.com"
    And the user enters a password "password123"
    And the user checks the terms and conditions checkbox
    And the user clicks the "Register" button
    Then the user should see an error message "Please fill in this Last Name" below the last name text box

  Scenario: Date of birth not filled
    Given the user is on the registration page
    When the user enters a first name "John"
    And the user enters a last name "Doe"
    And the user leaves the date of birth field empty
    And the user enters an email "john.doe@example.com"
    And the user re-enters the email "john.doe@example.com"
    And the user enters a password "password123"
    And the user checks the terms and conditions checkbox
    And the user clicks the "Register" button
    Then the user should see an error message "Please fill in this Date of Birth" below the date of birth text box

  Scenario: Email not filled
    Given the user is on the registration page
    When the user enters a first name "John"
    And the user enters a last name "Doe"
    And the user enters a date of birth "01/01/1990"
    And the user leaves the email field empty
    And the user re-enters the email "john.doe@example.com"
    And the user enters a password "password123"
    And the user checks the terms and conditions checkbox
    And the user clicks the "Register" button
    Then the user should see an error message "Please fill in this Email" below the email text box

  Scenario: Repeat email not filled
    Given the user is on the registration page
    When the user enters a first name "John"
    And the user enters a last name "Doe"
    And the user enters a date of birth "01/01/1990"
    And the user enters an email "john.doe@example.com"
    And the user leaves the repeat email field empty
    And the user enters a password "password123"
    And the user checks the terms and conditions checkbox
    And the user clicks the "Register" button
    Then the user should see an error message "Please fill in this Repeat Email" below the repeat email text box

  Scenario: Password not filled
    Given the user is on the registration page
    When the user enters a first name "John"
    And the user enters a last name "Doe"
    And the user enters a date of birth "01/01/1990"
    And the user enters an email "john.doe@example.com"
    And the user re-enters the email "john.doe@example.com"
    And the user leaves the password field empty
    And the user checks the terms and conditions checkbox
    And the user clicks the "Register" button
    Then the user should see an error message "Please fill in this Password" below the password text box

  Scenario: Mismatch in email and repeat email
    Given the user is on the registration page
    When the user enters a first name "John"
    And the user enters a last name "Doe"
    And the user enters a date of birth "01/01/1990"
    And the user enters an email "john.doe@example.com"
    And the user re-enters the email "john.doe1@example.com"
    And the user enters a password "password123"
    And the user checks the terms and conditions checkbox
    And the user clicks the "Register" button
    Then the user should see an error message "Emails do not match." below the repeat email text box

  Scenario: Password and repeat password do not match
    Given the user is on the registration page
    When the user enters a first name "John"
    And the user enters a last name "Doe"
    And the user enters a date of birth "01/01/1990"
    And the user enters an email "john.doe@example.com"
    And the user re-enters the email "john.doe@example.com"
    And the user enters a password "password123"
    And the user re-enters the password "password124"
    And the user checks the terms and conditions checkbox
    And the user clicks the "Register" button
    Then the user should see an error message "Passwords do not match." below the repeat password text box

  Scenario: Invalid date selection
    Given the user is on the registration page
    When the user enters a first name "John"
    And the user enters a last name "Doe"
    And the user selects an invalid day "31"
    And the user selects an invalid month "February"
    And the user selects a year "1990"
    And the user enters an email "john.doe@example.com"
    And the user re-enters the email "john.doe@example.com"
    And the user enters a password "password123"
    And the user checks the terms and conditions checkbox
    And the user clicks the "Register" button
    Then the user should see an error message "Invalid date selected." below the date of birth section

  Scenario: Day not selected
    Given the user is on the registration page
    When the user enters a first name "John"
    And the user enters a last name "Doe"
    And the user leaves the day dropdown unselected
    And the user selects a month "January"
    And the user selects a year "1990"
    And the user enters an email "john.doe@example.com"
    And the user re-enters the email "john.doe@example.com"
    And the user enters a password "password123"
    And the user checks the terms and conditions checkbox
    And the user clicks the "Register" button
    Then the user should see an error message "Please select a valid day." below the day dropdown

  Scenario: Month not selected
    Given the user is on the registration page
    When the user enters a first name "John"
    And the user enters a last name "Doe"
    And the user selects a day "01"
    And the user leaves the month dropdown unselected
    And the user selects a year "1990"
    And the user enters an email "john.doe@example.com"
    And the user re-enters the email "john.doe@example.com"
    And the user enters a password "password123"
    And the user checks the terms and conditions checkbox
    And the user clicks the "Register" button
    Then the user should see an error message "Please select a valid month." below the month dropdown

  Scenario: Year not selected
    Given the user is on the registration page
    When the user enters a first name "John"
    And the user enters a last name "Doe"
    And the user selects a day "01"
    And the user selects a month "January"
    And the user leaves the year dropdown unselected
    And the user enters an email "john.doe@example.com"
    And the user re-enters the email "john.doe@example.com"
    And the user enters a password "password123"
    And the user checks the terms and conditions checkbox
    And the user clicks the "Register" button
    Then the user should see an error message "Please select a valid year." below the year dropdown

  Scenario: First name is at minimum length (4 characters)
    Given the user is on the registration page
    When the user enters a first name "John"
    And the user enters a last name "Doe"
    And the user enters a date of birth "01/01/1990"
    And the user enters an email "john.doe@example.com"
    And the user re-enters the email "john.doe@example.com"
    And the user enters a password "password123"
    And the user checks the terms and conditions checkbox
    And the user clicks the "Register" button
    Then the user should be registered successfully

  Scenario: First name is at maximum length (150 characters)
    Given the user is on the registration page
    When the user enters a first name "<150 characters>"
    And the user enters a last name "Doe"
    And the user enters a date of birth "01/01/1990"
    And the user enters an email "john.doe@example.com"
    And the user re-enters the email "john.doe@example.com"
    And the user enters a password "password123"
    And the user checks the terms and conditions checkbox
    And the user clicks the "Register" button
    Then the user should be registered successfully

  Scenario: Last name is at minimum length (4 characters)
    Given the user is on the registration page
    When the user enters a first name "John"
    And the user enters a last name "Doe"
    And the user enters a date of birth "01/01/1990"
    And the user enters an email "john.doe@example.com"
    And the user re-enters the email "john.doe@example.com"
    And the user enters a password "password123"
    And the user checks the terms and conditions checkbox
    And the user clicks the "Register" button
    Then the user should be registered successfully

  Scenario: Last name is at maximum length (150 characters)
    Given the user is on the registration page
    When the user enters a first name "John"
    And the user enters a last name "<150 characters>"
    And the user enters a date of birth "01/01/1990"
    And the user enters an email "john.doe@example.com"
    And the user re-enters the email "john.doe@example.com"
    And the user enters a password "password123"
    And the user checks the terms and conditions checkbox
    And the user clicks the "Register" button
    Then the user should be registered successfully

  Scenario: Email is at maximum length (150 characters)
    Given the user is on the registration page
    When the user enters a first name "John"
    And the user enters a last name "Doe"
    And the user enters a date of birth "01/01/1990"
    And the user enters an email "<150 characters>@example.com"
    And the user re-enters the email "<150 characters>@example.com"
    And the user enters a password "password123"
    And the user checks the terms and conditions checkbox
    And the user clicks the "Register" button
    Then the user should be registered successfully

  Scenario: Password is at minimum length (6 characters)
    Given the user is on the registration page
    When the user enters a first name "John"
    And the user enters a last name "Doe"
    And the user enters a date of birth "01/01/1990"
    And the user enters an email "john.doe@example.com"
    And the user re-enters the email "john.doe@example.com"
    And the user enters a password "pass12"
    And the user checks the terms and conditions checkbox
    And the user clicks the "Register" button
    Then the user should be registered successfully

  Scenario: Password is at maximum length (20 characters)
    Given the user is on the registration page
    When the user enters a first name "John"
    And the user enters a last name "Doe"
    And the user enters a date of birth "01/01/1990"
    And the user enters an email "john.doe@example.com"
    And the user re-enters the email "john.doe@example.com"
    And the user enters a password "<20 characters>"
    And the user checks the terms and conditions checkbox
    And the user clicks the "Register" button
    Then the user should be registered successfully

    ##Additional Cases

  Scenario: Leading and trailing whitespace in input fields
    Given the user is on the registration page
    When the user enters a first name " John "
    And the user enters a last name " Doe "
    And the user enters a date of birth "01/01/1990"
    And the user enters an email " john.doe@example.com "
    And the user re-enters the email " john.doe@example.com "
    And the user enters a password " password123 "
    And the user checks the terms and conditions checkbox
    And the user clicks the "Register" button
    Then the user should be registered successfully and the whitespace should be trimmed

  Scenario: Duplicate form submission prevention
    Given the user is on the registration page
    When the user fills in all the mandatory fields with valid data
    And the user clicks the "Register" button multiple times rapidly
    Then the user should only be registered once

  Scenario: Email address with subdomain
    Given the user is on the registration page
    When the user enters an email "john.doe@sub.example.com"
    And the user re-enters the email "john.doe@sub.example.com"
    And the user enters all other valid details
    And the user clicks the "Register" button
    Then the user should be registered successfully

  Scenario: Special characters in first and last names
    Given the user is on the registration page
    When the user enters a first name "Jörn"
    And the user enters a last name "Döe"
    And the user enters a date of birth "01/01/1990"
    And the user enters an email "john.doe@example.com"
    And the user re-enters the email "john.doe@example.com"
    And the user enters a password "password123"
    And the user checks the terms and conditions checkbox
    And the user clicks the "Register" button
    Then the user should be registered successfully

  Scenario: Mixed case passwords
    Given the user is on the registration page
    When the user enters a password "Password123"
    And the user re-enters the password "Password123"
    And the user enters all other valid details
    And the user clicks the "Register" button
    Then the user should be registered successfully

  Scenario: Invalid characters in email address
    Given the user is on the registration page
    When the user enters an email "john.doe@example,com"
    And the user re-enters the email "john.doe@example,com"
    And the user enters all other valid details
    And the user clicks the "Register" button
    Then the user should see an error message "Invalid email."

  Scenario: Unusual but valid date of birth (leap year)
    Given the user is on the registration page
    When the user enters a date of birth "29/02/2000"
    And the user enters all other valid details
    And the user clicks the "Register" button
    Then the user should be registered successfully







