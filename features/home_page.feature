Feature: The Home Page

  As an iOS Developer
  I want to see the home page
  So that I can stay informed about new vendor packages on the site

  Scenario: User logs in successfully
    Given I have already logged in as "keithpitt"
    And I upload a vendor package called "DKBenchmark-0.1.vendor"

    When I go to the home page

    Then I should see "DKBenchmark"
