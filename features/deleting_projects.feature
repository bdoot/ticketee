Feature:
  In order to remove unnecessary
  As a user
  I want to delete them

Scenario:
  Given there is a project called "TextMate 2"
  And I am on the homepage

  When I follow "TextMate 2"
  And I follow "Delete Project"

  Then I should see "Project has been deleted"
  And I should not see "TextMate 2"