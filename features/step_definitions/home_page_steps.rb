require 'capybara'

Given(/^I am on the homepage$/) do
  visit '/'
end

When(/^I register to play the game$/) do
  fill_in 'player_name', with: 'Nick'
  click_button 'Register'
end

When(/^Another player registers to play the game$/) do
  fill_in 'player_name', with: 'Ben'
  click_button 'Register'
end

Then(/^I should wait for another player to join$/) do
  expect(page).to have_content 'Waiting for second player, Nick!'
end

Then(/^I should be asked to enter some ships$/) do
  expect(page).to have_content ("Please enter the coordinates and orientation of the ships you want to place.")
end

Given(/^I have registered$/) do
  visit '/'
  step("I register to play the game")
end

Given(/^Another player has registered$/) do
  visit '/'
  step("Another player registers to play the game")
end

Given(/^I have placed my ships$/) do
  select('A', from: 'ship_one_xaxis')
  select('1', from: 'ship_one_yaxis')
  select('vertically', from: 'ship_one_orientation')
  select('B', from: 'ship_two_xaxis')
  select('1', from: 'ship_two_yaxis')
  select('vertically', from: 'ship_two_orientation')
  select('C', from: 'ship_three_xaxis')
  select('1', from: 'ship_three_yaxis')
  select('vertically', from: 'ship_three_orientation')
  select('D', from: 'ship_four_xaxis')
  select('1', from: 'ship_four_yaxis')
  select('vertically', from: 'ship_four_orientation')
  select('E', from: 'ship_five_xaxis')
  select('1', from: 'ship_five_yaxis')
  select('vertically', from: 'ship_five_orientation')
  click_button 'Place Ships'
end

Given(/^Another player has placed their ships$/) do
  select('A', from: 'ship_one_xaxis')
  select('1', from: 'ship_one_yaxis')
  select('vertically', from: 'ship_one_orientation')
  select('B', from: 'ship_two_xaxis')
  select('1', from: 'ship_two_yaxis')
  select('vertically', from: 'ship_two_orientation')
  select('C', from: 'ship_three_xaxis')
  select('1', from: 'ship_three_yaxis')
  select('vertically', from: 'ship_three_orientation')
  select('D', from: 'ship_four_xaxis')
  select('1', from: 'ship_four_yaxis')
  select('vertically', from: 'ship_four_orientation')
  select('E', from: 'ship_five_xaxis')
  select('1', from: 'ship_five_yaxis')
  select('vertically', from: 'ship_five_orientation')
  click_button 'Place Ships'
end

Given(/^I am on the waiting page$/) do
  visit '/waiting'
end

Given(/^another player joins$/) do
  step("I have registered")
  step("I have placed my ships")
  step("Another player has registered")
  step("Another player has placed their ships")
end

Then(/^I should be redirected to the play page$/) do
  expect(page).to have_content("Play Game")
end
