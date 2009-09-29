@projects
Feature: Manage projects
  In order to publish details about projects to my portfolio
  As a website owner
  I want to manage the metadata about projects
  
  Background:
    Given I have a site "My Site"
    Given the admin is logged in
    
  Scenario: Create a new project
    Given I have no projects
    When I go to the list of projects
    And I follow "New Project"
    And I fill in "Name" with "First Project"
    And I fill in "Description" with "Some details about the project"
    And I fill in "Role" with "Web developer"
    And I fill in "Duration" with "1 month"
    And I fill in "Url" with "http://www.google.com"
    And I press "Save"
    Then I should see "Save successful!"
    And I should see "First Project"
    And I should have 1 project

  Scenario: View a list of projects
    Given I have projects "Project One, Project Two"
    When I go to the list of projects
    Then I should see "Project One"
    And I should see "Project Two"
    And I should have 2 projects
  
  Scenario: Edit a project
    Given I have projects "Project One, Project Two"
    When I go to the list of projects
    And I follow "Project One"
    And I follow "Edit"
    When I fill in "Name" with "Changed project name"
    And I press "Save"
    Then I should see "Save successful!"
    And I should see "Changed project name"
    And I should not see "Project One"
    And I should have 2 projects
    
  Scenario: Create a new project with an upload
    Given I have no projects
    And I have no uploads
    When I go to the list of projects
    And I follow "New Project"
    And I fill in "Name" with "First Project"
    And I fill in "Description" with "Some details about the project"
    And I fill in "Role" with "Web developer"
    And I fill in "Duration" with "1 month"
    And I fill in "Url" with "http://www.google.com"
    And I attach a file onto "project_uploads_attributes_0_data"
    And I press "Save"
    Then I should see "Save successful!"
    And I should have 1 project
    And I should have 1 upload