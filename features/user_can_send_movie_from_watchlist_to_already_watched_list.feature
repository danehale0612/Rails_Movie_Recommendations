Feature: Users can go into their watchlist
Users can select a movie that was sent to their watch list
And they can send that movie to their already watched list and go back to their watch list
That movie will be removed from the watch list and in the Already Watched List

  Scenario: User sends a movie from their watch list to their already watched list
    Given the user "bob@example.com" with password "password1"
    When I go to the homepage
    And I sign in as "bob@example.com" with "password1"
    Then I go to "Terminator" recommendations
    Then I go into "Predator" to "Send to Watch List"
    Then I go to "Watch List"
    And I click "Predator"
    And I press "Send to Already Watched List"
    And I should see "Watch List"
    And I should see "'Predator' has been added to 'Already Watched List'"
    Then I press "Go To User Screen"
    And I press "Already Watched List"
    And I should see "Predator"