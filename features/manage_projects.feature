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
    And I follow "Project"
    And I fill in "Name" with "First Project"
    And I fill in "Description" with "Some details about the project"
    And I fill in "Role" with "Web developer"
    And I fill in "Duration" with "1 month"
    And I fill in "Url" with "http://www.google.com"
    And I press "Save"
    Then I should see "Create successful!"
    And I should see "First Project"
    And I should see "Some details about the project"
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
    And I edit the project "Project One"
    When I fill in "Name" with "Changed project name"
    And I press "Save"
    Then I should see "Save successful!"
    And I should see "Changed project name"
    And I should not see "Project One"
    And I should have 2 projects
    
  Scenario: Add an upload to an existing project
    Given I have no uploads
    Given I have projects "Project One, Project Two"
    When I go to the list of projects
    And I follow "Project One"
    And I edit the project "Project One"
    When I follow "Add Upload"
    And I attach a file onto "upload_data"
    And I press "Save"
    Then I should see "Upload saved"
    And I should have 2 projects
    And I should have 1 upload