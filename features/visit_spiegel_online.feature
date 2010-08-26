Feature: Perform a search on SPIEGEL ONLINE
    
  Scenario: Visit Website
    Given I am on home
    When I fill in "spSearch" with "Roland Koch"
    And I click on image "spSearchGo"
    Then I should see "Ihre Suche: Roland Koch"