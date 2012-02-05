Feature: Hidden Links
  I order to clean up the user experience
  As the system
  I want to hide links from users that cant use them

  Background:
    Given there are the following users:
      | email              | password | admin |
      | user@ticketee.com  | password | false |
      | admin@ticketee.com | password | true  |
    And there is a project called "TextMate 2"

  Scenario: New project link for users not signed in
    When I am on the homepage
    Then I should not see the "New Project" link

  Scenario: New project link for normal users
    Given I am on the homepage
    When I am signed in as "user@ticketee.com"
    Then I should not see the "New Project" link

  Scenario: New project link for admin users
    Given I am on the homepage
    When I am signed in as "admin@ticketee.com"
    Then I should see the "New Project" link

  Scenario: Edit project link is hidden for users not signed in
    Given I am on the homepage
    When I follow "TextMate 2"
    Then I should not see the "Edit Project" link

  Scenario: Edit project link is hidden for standard users
    Given I am on the homepage
    And I am signed in as "user@ticketee.com"
    When I follow "TextMate 2"
    Then I should not see the "Edit Project" link

  Scenario: Edit project link is shown for admin users
    Given I am on the homepage
    And I am signed in as "admin@ticketee.com"
    When I follow "TextMate 2"
    Then I should see the "Edit Project" link

  Scenario: Delete project link is hidden for users not signed in
    Given I am on the homepage
    When I follow "TextMate 2"
    Then I should not see the "Delete Project" link

  Scenario: Delete project link is hidden for standard users
    Given I am on the homepage
    And I am signed in as "user@ticketee.com"
    When I follow "TextMate 2"
    Then I should not see the "Delete Project" link

  Scenario: Delete project link is shown for admin users
    Given I am on the homepage
    And I am signed in as "admin@ticketee.com"
    When I follow "TextMate 2"
    Then I should see the "Delete Project" link


