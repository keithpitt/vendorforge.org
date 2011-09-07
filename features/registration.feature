Feature: Registration

  As an iOS Developer
  I want to register
  So that I can publish vendor packages to the site

  Scenario: User registers successfully
    Given I am on the registration page

    When I register successfully

    Then I should see "Welcome! You have signed up successfully."
    And I should be logged in
    And I should be on the home page

  Scenario: User registers unsuccessfully
    Given I am on the registration page

    When I register unsuccessfully

    Then I should see "Whoops, Try Again"
    And I should not be logged in
    And I should see the registration form
