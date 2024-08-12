Feature: User Login

  Scenario: Successful Login with Valid Credentials
    Given the user is on the login page
    When the user enters valid username and password
    And the user clicks on the login button
    Then the user should be redirected to the dashboard