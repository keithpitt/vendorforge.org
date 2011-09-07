Feature: User Logout

  As an iOS Developer
  I want to logout
  So that I can keep my session secure

  Scenario: User logs out successfully
    Given I have already logged in

    When I logout successfully

    Then I should see "Signed out successfully."
    And I should be on the home page
