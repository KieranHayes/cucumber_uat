Feature: Perform a search on SPIEGEL ONLINE
    
  Scenario: Visit Website
    Given I am on home
    And I fill in "spSearch" with "Roland Koch"
    And I click on image "spSearchGo"
    Then I should see "Ihre Suche: <span>Roland Koch</span>"