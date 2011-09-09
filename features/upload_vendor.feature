Feature: Upload Vendor Package

  As an iOS Developer
  I want to upload vendor packages
  So that I can be awesome to the open source iOS community

  Scenario: User uploads a vendor package successfully
    Given I have already logged in
    And I go to the vendor upload page

    When I upload a vendor package called "DKBenchmark-0.1.vendor"

    Then I should see "Vendor uploaded successfully"
    And I should be on the "DKBenchmark" vendor page

  Scenario: User uploads a vendor package unsuccessfully
    Given I have already logged in
    And I go to the vendor upload page

    When I upload a vendor package called "DKBenchmark-0.1-broken.vendor"

    Then I should see "invalid vendor spec"
    And I should see the vendor upload form
