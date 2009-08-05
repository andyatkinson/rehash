@comments
Feature: Manage comments
  In order to create new comments on articles
  As a visitor to the site
  I want to create a new comment
  
  Background:
    Given I have a site "My Site"
    Given the admin is logged in
    Given the following articles
    | title       | body            |
    | Minneapolis | Is a cool city  |
    | St. Paul    | Is kind of cool |
  
  Scenario: View comments for article
    Given I have a comment from "John Doe" for the article "Minneapolis"
    When I go to the article titled Minneapolis
    Then I should see "John Doe"
  
  Scenario: Create a new comment
    When I go to the article titled Minneapolis
    When I fill in "Name" with "John Doe"
    And I fill in "Body" with "Interesting article!"
    And I press "Submit"
    Then I should see "Create successful!"
    And I should see "Interesting article!"
    
  Scenario: Edit an existing comment
    Given I have a comment from "John Doe" for the article "Minneapolis"
    When I go to the comment from "John Doe"
    And I follow "Edit"
    And I fill in "Name" with "New name"
    And I press "Submit"
    Then I should see "Save successful!"
    Then I should see "New name"

  Scenario: Delete an existing comment
    Given I have a comment from "John Doe" for the article "Minneapolis"
    And I go to the list of comments for "Minneapolis"
    Then I should see "John Doe"
    When I delete the comment from "John Doe"
    Then I should see "Record deleted!"
    Then I should not see "New name"
    And I should have 0 comments
    
  Scenario: View all comments as an admin
    Given I have a comment from "John Doe" for the article "Minneapolis"
    When I go to the list of comments
    Then I should see "John Doe"