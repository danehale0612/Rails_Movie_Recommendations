Feature: Users can go into their watchlist
Users can select a movie that was sent to their watch list
And they can leave that movie to go back to their watch list

  Scenario: User leaves a movie profile in their watch list
    Given the user "bob@example.com" with password "password1"
    When I go to the homepage
    And I sign in as "bob@example.com" with "password1"
    Then I go to "Terminator" recommendations
    Then I go into "Predator" to "Send to Watch List"
    Then I go to "Watch List"
    And I click "Predator"
    And I press "Leave Movie"
    And I should see "Watch List"
    And I should see "Predator"