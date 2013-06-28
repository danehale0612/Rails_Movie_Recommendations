Feature: Users can select a movie from recommendation list and send that movie to their watchlist

  Scenario: User sends recommendation movie to watch list
    Given the user "bob@example.com" with password "password1"
    When I go to the homepage
    And I sign in as "bob@example.com" with "password1"
    Then I go to "Terminator" recommendations
    Then I click "1) Predator"
    Then I click "Send to Watch List"
    And I should see "'Predator' has been added to 'Watchlist'"
    And I should not see "1) Predator"
    Then I go to "Watch List"
    And I should see "Predator"