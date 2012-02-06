Feature:
  In order to add new users to the system
  As an admin
  I want to be able to create new users through the backend

  Background:
    Given there are the following users:
      | email              | password | admin |
      | admin@ticketee.com | password | true  |
    And I am signed in as "admin@ticketee.com"
    Given I am on the homepage
    When I follow "Admin"
    And I follow "Users"
    And I follow "New User"

  Scenario: Creating a new user
    When I fill in "Email" with "user@ticketee.com"
    And I fill in "Password" with "password"
    And I press "Create User"
    Then I should see "User has been created."

  Scenario: Creating a user with a blank email
    When I fill in "Email" with ""
    And I fill in "Password" with "password"
    And I press "Create User"
    Then I should see "User has not been created."
    And I should see "Email can't be blank"