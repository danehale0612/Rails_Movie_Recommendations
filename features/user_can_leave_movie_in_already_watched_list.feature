Feature: Users can go into their already watched list
Users can select a movie that was sent to their already watched list
And they can leave that movie to go back to their already watched list

  Scenario: User leaves a movie profile in their watch list
    Given the user "bob@example.com" with password "password1"
    When I go to the homepage
    And I sign in as "bob@example.com" with "password1"
    Then I go to "Terminator" recommendations
    Then I go into "Predator" to "Send to Already Watched List"
    Then I go to "Already Watched List"
    And I click "Predator"
    And I click link "Leave Movie"
    And I should see "Already Watched List"
    And I should see "Predator"