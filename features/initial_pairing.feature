Feature: Initial Pairing
  As an excited Programmer
  So that I can enjoy pairing goodness
  I want to pair online with a stranger
  
  Scenario:
    Given that a user loads the site
    Then I should see "waiting for pair partner ..."
    When another user joins
    Then I should see "preparing your pair room"
    And the other user should see the jitsy plugin load
    And I should see the jitsy plugin should load
