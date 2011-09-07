Feature: User Login

  As an iOS Developer
  I want to login
  So that I can publish vendor packages to the site

  Scenario: User logs in successfully
    Given I am on the home page
    And I have already signed up as "me@keithpitt.com"

    When I login successfully

    Then I should see "Signed in successfully"
    And I should not be on the login page

  Scenario: User logs in unsuccessfully
    Given I am on the home page
    And I have already signed up as "me@keithpitt.com"

    When I login unsuccessfully

    Then I should see "Invalid email or password."
    And I should be on the login page
