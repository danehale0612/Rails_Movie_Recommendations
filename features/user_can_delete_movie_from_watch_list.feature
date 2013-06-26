Feature: Users can go into their watchlist
Users can select a movie that was sent to their watch list
And they can delete that movie from their watch list

  Scenario: User deletes a movie from watch list and movie should show up in recommendations
    Given the user "bob@example.com" with password "password1"
    When I go to the homepage
    And I sign in as "bob@example.com" with "password1"
    Then I go to "Terminator" recommendations
    Then I go into "Predator" to "Send to Watch List"
    Then I go to "Watch List"
    And I click "Predator"
    And I press "Delete Movie From Watch List"
    And I should see "Watch List"
    And I should see "'Predator' has been deleted from 'Watch List'"
    Then I press "Go To User Screen"
    Then I go to "Terminator" recommendations
    And I should see "1) Predator"