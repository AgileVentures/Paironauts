Feature: Initial Pairing
  As an excited Programmer
  So that I can enjoy pairing goodness
  I want to pair online with a stranger
  
  Scenario: Joining a room with a pair partner
    Given that I visit the home page
    Then I should see "waiting for pair partner ..."
    When another user joins
    Then I should see "preparing your pair room"
    And the other user should see the room load
    And I should see the room should load
    
  Scenario: Loading(when no one present)
    Given that I visit the home page
    Then I should see "waiting for pair partner ..."
    
  Scenario: Loading site (when others present)
    Given that I visit the home page
    Then I should see "preparing your pair room"
    And I should see the room should load 
    And the other user should see the room load
