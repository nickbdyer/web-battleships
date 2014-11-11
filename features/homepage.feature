Feature: In order to have some fun
  As a fun loving person
  In order to have some fun
  I want to play Battleships

  Scenario: Registering the first player
    Given I am on the homepage
    When I register to play the game
    Then I should wait for another player to join
