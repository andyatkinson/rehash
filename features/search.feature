@search
Feature: Search articles
  In order to find old articles
  As a visitor
  I want to search and find articles
  
  Background:
    Given I have a site "My Site"
  
  Scenario: Search for article by title
    Given I have articles titled Minneapolis, St. Paul
    When I go to the list of articles
    When I fill in "q" with "Minneapolis"
    And I press "Search"
    Then I should see "Minneapolis"
    And I should not see "St. Paul"
  
  Scenario: Unpublished articles are not visible
    And I have unpublished articles "Secret Blog post"
    When I go to the list of articles
    And I fill in "q" with "Secret"
    And I press "Search"
    Then I should not see "Secret"