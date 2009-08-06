@search
Feature: Search articles
  In order to find old articles
  As a visitor
  I want to search and find articles
  
  Scenario: Search for article by title
    Given I have a site "My Site"
    Given I have articles titled Minneapolis, St. Paul
    When I go to the list of articles
    When I fill in "q" with "Minneapolis"
    And I press "Go"
    Then I should see "Minneapolis"
    And I should not see "St. Paul"
  
  Scenario: Unpublished articles are not visible
    Given I have a site "My Site"
    And I have unpublished articles "Secret Blog post"
    When I go to the list of articles
    And I fill in "q" with "Secret"
    And I press "Go"
    Then I should not see "Secret"