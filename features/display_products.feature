Feature: Display Products
  In order to purchase the right product
  As a customer
  I want to browse products and see detailed information

  Scenario: Show product
    Given a product exists with name: "Milk", price: "2.99"
    When I go to the show page for that product
    Then I should see "Milk"
    And I should see "£2.99"

  Scenario: List products
    Given the following products exist
    | name | price |
    | Milk | 2.99 |
    | Puzzle | 8.99 |
    
    When I go to path "/products" 
    Then I should see "Milk"
    And I should see "£2.99"
    Then I should see "Puzzle"
    And I should see "£8.99"
    When I fill in "search" with "milk"
    When I press "go_button"
    Then I should see "Milk"     
    Then I should not see "Puzzle"     
    When I fill in "search" with "book"
    When I press "go_button"
    Then I should not see "book"
    Then I should not see "Milk"
    Then I should not see "Puzzle"    