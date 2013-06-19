@wip
Feature: Users can log in and log out
  In order to save my projects
  As a user
  I want to log in

  Scenario: Happy Path
    Given the user "bob@example.com" with password "password1"
    When I go to the homepage
    And I click "sign in"
    And I fill in "bob@example.com" for "Email"
    And I fill in "password1" for "Password"
    And I press "Sign in"
    Then I should see "You are now signed in."
    And I should not see "sign in"

  Scenario: Wrong Password

  Scenario: Wrong Username