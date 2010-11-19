Feature: Perform a product search
    
  Scenario: Visit latest offers
    Given I am on home
    When I follow "Aktuelle Angebote"
    And I follow "weiter" within ".specialoffers1"
    Then I should see "Angebote ab Montag, 22. November"

  Scenario: Tests Produktliste
    Given I am on home
    When I follow "Aktuelle Angebote"
    And I follow "weiter" within ".specialoffers1"
    And I follow "CRANE SPORTS® Ski-Jacke, softshell" within ".specialoffers1"
    Then I should see "In Einkaufsliste legen"