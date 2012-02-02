Feature:
  In order to assign tickets to projects
  As a user
  I need to be able to create tickets from the project page

  Background:
    Given there is a project called "Internet Explorer"
    And I am on the homepage
    When I follow "Internet Explorer"
    And I follow "New Ticket"

  Scenario: Creating a new ticket
    When I fill in "Title" with "Non-standard compliance"
    And I fill in "Description" with "My pages are ugly!"
    And I press "Create Ticket"
    Then I should see "The ticket has been created"
    And I should see "Non-standard compliance"
    And I should see "My pages are ugly!"

  Scenario: Creating a new ticket with invalid parameters
    When I press "Create Ticket"
    Then I should see "The ticket has not been created"
    And I should see "Title can't be blank"
    And I should see "Description can't be blank"

  Scenario: Creating a new ticket with description shorter than 10 characters
    When I fill in "Title" with "Non-standard compliance"
    And I fill in "Description" with "1"
    And I press "Create Ticket"
    Then I should see "The ticket has not been created"
    And I should see "Description is too short"
