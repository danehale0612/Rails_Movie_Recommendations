Feature: Users can select a movie from recommendation list and send that movie to their already watched list

  Scenario: User sends recommendation movie to already watched list
    Given the user "bob@example.com" with password "password1"
    When I go to the homepage
    And I sign in as "bob@example.com" with "password1"
    Then I go to "Terminator" recommendations
    Then I click "1) Predator"
    Then I click "Send to Already Watched List"
    And I should see "'Predator' has been added to 'Already Watched List'"
    And I should not see "1) Predator"
    Then I go to "Already Watched List"
    And I should see "Predator"