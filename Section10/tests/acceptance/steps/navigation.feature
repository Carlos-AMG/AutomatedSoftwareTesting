Feature: Test navigation between pages 

Scenario: Homepage can go to Blog
    Given I am on the homepage
    When I click on the "Go to Blog" link
    Then I am on the blog page

Scenario: Blog can go to homepage
    Given I am on the blog page
    When I click on the "Go to Home" link
    Then I am on the homepage