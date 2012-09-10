Feature: Authentication
  In oder to avoid unauthorized access to the web interface
  As a user without an account
  I want to have an login for users and administrators

  Scenario: Not authenticated
    Given I want to see the root page
    When I am not authenticated
    Then I should be redirected to the new_user_session page

  Scenario: Authentication as user
    Given I want to see the root page
    When I authenticate as user // useruser
    Then I want to see the root page
    And see the "Overview" headline

  Scenario: Authenticate as admin
    Given I want to see the root page
    When I authenticate as admin // adminadmin
    Then I want to see the root page
    And see the "Overview" headline
    And see the "User management" menu

  Scenario: Authenticated with non registered user
    Given I want to see the root page
    When I authenticate with wrong data
    Then I should be redirected to the new_user_session page