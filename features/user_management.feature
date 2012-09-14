Feature: User management
  In order to have more then one user on the system
  As an administrator
  I want to be able to create, edit and delete users

  Scenario: Denial access for normal users
    Given I am authenticated as user // useruser
    When I want to see the users page
    Then I should get an access denialed error

  Scenario: See all users in the list
    Given I am authenticated as admin // adminadmin
    And I have 2 users in the database
    When I want to see the users page
    Then I want to see all users in the list

  Scenario: Add new user
    Given I am authenticated as admin // adminadmin
    When I want to see the new_user page
    And I add a new user with test // testtest // test@example.com
    Then I want to see the user test in the list

  Scenario: Edit user
    Given I am authenticated as admin // adminadmin
    When I want to see the edit_user page for id 1
    And change the username to test
    Then I want to see the user test in the list

  Scenario: Delete user
    Given I am authenticated as admin // adminadmin
    And I want to see the new_user page
    And I add a new user with test // testtest // test@example.com
    When I delete user 2
    Then I want to see the user admin in the list
    And I don't want to see the user test in the list