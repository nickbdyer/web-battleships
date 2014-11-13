Feature: In order to have some fun
  As a fun loving person
  In order to have some fun
  I want to play Battleships

  Scenario: Registering the first player
    Given I am on the homepage
    When I register to play the game
    Then I should be asked to enter some ships

  Scenario: Starting the game
    Given I have placed my ships
    And I am waiting for another player to join
    When Another player joins
    Then I should be redirected to the play page

