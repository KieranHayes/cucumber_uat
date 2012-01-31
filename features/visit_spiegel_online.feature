@spiegel
Feature: Perform a search on SPIEGEL ONLINE

  Scenario: Visit Website
    Given I am on home
    When I fill in "suchbegriff" with "Rudolf Augstein"
    And I click on element "searchbutton"
    Then I should see "Ihre Suche: Rudolf Augstein"