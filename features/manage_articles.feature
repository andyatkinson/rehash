@articles
Feature: Manage Articles
  In order to make a blog
  As an admin
  I want to create and manage articles
  
  Background:
    Given I have a site "My Site"
    Given the admin is logged in
  
  Scenario: Articles List
    Given I have articles titled Minneapolis, St. Paul
    When I go to the list of articles
    Then I should see "Minneapolis"
    And I should see "description"
    And I should see "St. Paul"
    When I follow "Minneapolis"
    Then I should see "Minneapolis"
    And I should not see "description"
    
  Scenario: Create Valid Article
    Given I have no articles
    Given I am on the list of articles
    When I follow "New Article"
    And I fill in "Title" with "Minneapolis"
    And I fill in "Body" with "Minneapolis is a great city!"
    And I check "Published"
    And I press "Submit"
    Then I should see "Create successful!"
    And I should see "Minneapolis"
    And I should see "Minneapolis is a great city!"
    And I should have 1 article
    
  Scenario: Create an unpublished article
    Given I have no articles
    Given I am on the list of articles
    When I follow "New Article"
    And I fill in "Title" with "Minneapolis"
    And I fill in "Body" with "Minneapolis is a great city!"
    And I press "Submit"
    Then I should see "Unpublished article"
    
  Scenario: Edit Valid Article
    Given I have articles titled Minneapolis, St. Paul
    When I go to the article titled Minneapolis
    And I follow "Edit"
    And I fill in "Title" with "Roseville"
    And I press "Submit"
    Then I should see "Save successful!"
    And I should see "Roseville"
    And I should not see "Minneapolis"
    And I should have 2 articles
    
  Scenario: Delete Valid Article
    Given I have articles titled Minneapolis, St. Paul
    When I go to the article titled Minneapolis
    And I delete the article Minneapolis
    Then I should see "Record deleted!"
    And I should have 1 article
    
  Scenario: View an article feed
    Given I have articles titled Minneapolis, St. Paul
    When I go to the feed
    Then I should see "Minneapolis"
    And I should see the site title
  
  
  