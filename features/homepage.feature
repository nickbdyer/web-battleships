Feature: In order to have some fun
  As a fun loving person
  In order to have some fun
  I want to play Battleships

  Scenario: Registering the first player
    Given I am on the homepage
    When I register to play the game
    Then I should be asked to enter some ships

  Scenario: Placing Ships
    Given I have registered
    And I have placed my ships
    Then I should wait for another player to join

  Scenario: Starting Game
    Given I am on the waiting page
    And another player joins
    Then I should be redirected to the play page
