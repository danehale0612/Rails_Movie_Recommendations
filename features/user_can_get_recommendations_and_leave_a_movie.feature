Feature: Users can enter a movie
  Get a list of movie recommendations in return
  Users can browse individual titles
  User can go into a movie profile and leave it

  Scenario: User leaves indivdual movie profile to recommendations
    Given the user "bob@example.com" with password "password1"
    When I go to the homepage
    And I sign in as "bob@example.com" with "password1"
    Then I press "Recommend Movies"
    And I should see "Type in a Movie Title for Recommendations:"
    Then I fill in "Terminator" for "Search Recommendation"
    And I press "Get Recommendations"
    Then I should see "1) Predator"
    And I click "1) Predator"
    And I should see "Director: John McTiernan"
    Then I click "Leave Movie"
    And I should see "Recommendations for "Terminator"
    And I should see "1) Predator"
    Then I should not see "'Predator' has been added to 'Watchlist'"
    Then I should not see "'Predator' has been added to 'Already Watched List'"
