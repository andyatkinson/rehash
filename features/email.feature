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
  
  Scenario: Receive an email for new comments
    Given I have articles titled Minneapolis, St. Paul
    When I go to the article titled Minneapolis
    When I fill in "Name" with "John Doe"
    And I fill in "Email" with "email@email.com"
    And I fill in "Body" with "Interesting article!"
    And I fill in "comment_challenge" with "4"
    And I press "Save comment"
    Then I should see "Comment saved"
    And the site owner should receive an email