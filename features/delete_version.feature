Feature: Delete Version Package

  As an iOS Developer
  I want to delete a vendor
  So that I can fix my mistakes

  Scenario: User deletes a vendor package successfully
    Given I have already logged in
    And I go to the vendor upload page

    When I upload a vendor package called "DKBenchmark-0.1.vendor"

    And I delete the vendor called "DKBenchmark"
    Then I should see "DKBenchmark v0.1 was deleted succesfully"

  Scenario: A user who didnt upload the vendor cannot see the "Delete Version" button
    Given I have already logged in
    And I go to the vendor upload page
    And I upload a vendor package called "DKBenchmark-0.1.vendor"
    And I logout successfully

    When I have already logged in as "another_user"

    Then I shouldn't be able to delete the vendor called "DKBenchmark"
