@site
Feature: Manage site
  In order to update site details
  As a admin
  I want to create and manage my site
      
  Scenario: Create site
    Given I have no site
    When I go to the home page
    Then I should see "Please create your site"
    When I fill in "Name" with "MySite"
    And I fill in "Tagline" with "Catchy phrase about mysite"
    And I fill in "Owner name" with "Andy"
    And I fill in "Owner email" with "foo@bar.com"
    And I fill in "Password" with "1234"
    And I press "Submit"
    Then I should see "Site created!"
    And I should have 1 site
    
  Scenario: Cant create site with invalid data
    Given I have no site
    When I go to the home page
    Then I should see "Please create your site"
    When I press "Submit"
    Then I should see "Error"
    And I should not see "Site created!"
    And I should have 0 sites 
    
  Scenario: Edit site details
    Given I have no site
    Given I have a site "My Site"
    Given the admin is logged in
    When I go to the home page
    Then I should see "Logout"
    And I follow "Edit Site"
    When I fill in "Name" with "New homepage"
    And I press "Submit"
    Then I should see "Site updated!"
    And I should see "New homepage"
    And I should not see "My Site"
    And I should have 1 site