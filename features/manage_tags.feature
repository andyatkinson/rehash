@tagging
Feature: Manage tags
  In order to categorize articles
  As a admin
  I want add tags to a article
  
  Background:
    Given I have a site "My Site"
    Given the admin is logged in
  
  Scenario: View list of tags
    Given I have tags Foo, Bar, Baz
    When I go to the list of tags
    Then I should see "Foo"
    And I should see "Bar"
    And I should see "Baz"
    
  Scenario: Add a new tag
    Given I have tags Foo, Bar
    Then I should have 2 tags
    When I go to the list of tags
    Then I follow "New tag"
    And I fill in "Name" with "Baz"
    And I press "Submit"
    Then I should see "Create successful!"
    And I should see "Baz"
    And I should have 3 tags
    
  Scenario: Add a tag to an article
    Given I have tags Foo, Bar
    And I have articles with tag Foo titled Minneapolis
    When I go to the article titled Minneapolis
    Then article Minneapolis should have 1 tag
    And I follow "Edit"
    And I check tag Foo
    And I press "Submit"
    Then I should see "Save successful!"
    Then article Minneapolis should have 2 tags
    And I should see "Foo"
    
  Scenario: Edit a tag
    Given I have tags Foo, Bar
    When I go to the tag Foo
    And I follow "Edit"
    And I fill in "Name" with "Travel"
    And I press "Submit"
    Then I should see "Save successful!"
    And I should see "Travel"
    And I should not see "Foo"
    And I should have 2 tags
    
  Scenario: Delete a tag
    Given I have tags Foo, Bar
    When I go to the tag Foo
    And I delete the tag Foo
    Then I should see "Record deleted!"
    And I should not see "Foo"
    And I should have 1 tag
    
  Scenario: Find tagged articles
    Given I have tags Foo, Bar
    And I have articles with tag Foo titled Minneapolis
    When I go to the list of articles
    And I follow "Bar"
    Then I should see "No results"
    When I go to the article titled Minneapolis
    And I follow "Edit"
    And I check tag Foo
    And I press "Submit"
    Then I should see "Save successful!"
    When I go to the list of articles
    When I follow "Foo"
    Then I should see "Minneapolis"