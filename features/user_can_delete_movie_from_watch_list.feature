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
    And I click link "Delete Movie From Watch List"
    And I should see "Watch List"
    And I should see "predator has been deleted from watch list"
    And I should not see "Predator"
    Then I click link "Go To User Screen"
    Then I go to "Terminator" recommendations
    And I should see "1) Predator"