@pages
Feature: Manage pages
  In order to display content that changes infrequently
  As a admin
  I want create and edit pages
  
  Background:
    Given I have a site "My Site"
    Given the admin is logged in

  Scenario: View a list of pages
    Given I have pages About, Resume
    When I go to the list of pages
    Then I should see "About"
    And I should see "Resume"
    
  Scenario: Create a new page
    Given I have no pages
    When I go to the list of pages
    And I follow "Page"
    And I fill in "Name" with "About"
    And I fill in "Body" with "Some about page text"
    And I press "Submit"
    Then I should see "Create successful!"
    And I should see "Some about page text"
    And I should have 1 page
    
  Scenario: Edit an existing page
    Given I have pages About, Resume
    When I go to the page About
    And I edit the page About
    And I fill in "Body" with "lorem ipsum"
    And I press "Submit"
    Then I should see "lorem ipsum"
    And I should not see "body"
    And I should have 2 pages
    
  Scenario: Delete an existing page
    Given I have pages About, Resume
    When I go to the page About
    Then I delete the page About
    Then I should see "Record deleted!"
    And I should not see "About"
    And I should have 1 page