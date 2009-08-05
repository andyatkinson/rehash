@public
Feature: Hide and show certain items
  In order to maintain security
  As a public non-admin visitor
  I want to see only what is visible to public visitors
  
  Background:
    Given I have a site "My Site"
  
  Scenario: I should not be able to see unpublished articles
    Given I have articles titled Minneapolis
    Given I have unpublished articles titled St. Paul
    When I go to the list of articles
    Then I should see "Minneapolis"
    And I should not see "St. Paul"
    And I should have 2 articles
    
  Scenario: I should not be able to navigate directly to unpublished articles
    Given I have unpublished articles titled Minneapolis
    Then the article Minneapolis should not be found
  
  Scenario: I should not be able to see a list of pages
    Given I have pages About, Contact
    When I go to the list of pages
    Then I should not see "About"
  
  
  