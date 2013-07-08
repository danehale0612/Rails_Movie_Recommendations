@wip
Feature: Users can go into their already watched list
Users can select a movie that was sent to their already watched list
And they can delete that movie from their already watched list

  Scenario: User deletes a movie from already watched list and movie should show up in recommendations
    Given the user "bob@example.com" with password "password1"
    When I go to the homepage
    And I sign in as "bob@example.com" with "password1"
    Then I go to "Terminator" recommendations
    Then I go into "Predator" to "Send to Already Watched List"
    Then I go to "Already Watched List"
    And I click "Predator"
    And I press "Delete Movie From Already Watched List"
    And I should see "Already Watched List"
    And I should see "'Predator' has been deleted from 'Already Watched List'"
    Then I press "Go To User Screen"
    Then I go to "Terminator" recommendations
    And I should see "1) Predator"