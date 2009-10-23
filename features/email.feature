@email
Feature: App should send email
  In order to keep the site owner informed
  As a visitor
  I want to contact the site owner
  
  Background:
     Given I have a site "My Site"
     
  Scenario: Contact form should send email
    When I go to the contact page
    And I fill in "sender_name" with "Visitor name"
    And I fill in "Email" with "Visitor email"
    And I fill in "Message" with "I would like to contact you"
    And I press "Send"
    Then I should see "Email sent"
    And I should not see "All fields are required"
    
  Scenario: Contact form should prevent incomplete postings
    When I go to the contact page
    And I fill in "sender_name" with "Visitor name"
    And I fill in "Email" with "Visitor email"
    And I fill in "Message" with "I would like to contact you"
    And I press "Send"
    Then I should not see "Message Sent."