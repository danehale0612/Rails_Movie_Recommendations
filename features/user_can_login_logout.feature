@wip
Feature: Users can log in and log out
  In order to save my projects
  As a user
  I want to log in

  Scenario: Happy Path
    Given the user "bob@example.com" with password "password1"
    When I go to the homepage
    And I click "Sign in"
    And I fill in "bob@example.com" for "Email"
    And I fill in "password1" for "Password"
    And I press "Sign In"
    Then I should see "You are now logged in."
    And I should not see "Log In"

  Scenario: Wrong Password

  Scenario: Wrong Username