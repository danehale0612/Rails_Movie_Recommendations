Feature: Users can go into their already watched list
Users can select a movie that was sent to their already watched list
And they can send that movie to their watch list and go back to their already watched list
That movie will be removed from the already watched list and in the watch List

  Scenario: User sends a movie from their already watched list to their watch list
    Given the user "bob@example.com" with password "password1"
    When I go to the homepage
    And I sign in as "bob@example.com" with "password1"
    Then I go to "Terminator" recommendations
    Then I go into "Predator" to "Send to Already Watched List"
    Then I go to "Already Watched List"
    And I click "Predator"
    And I press "Send to Watch List"
    And I should see "Already Watched List"
    And I should see "'Predator' has been added to 'Watch List'"
    Then I press "Go To User Screen"
    And I press "Watch List"
    And I should see "Predator"