Given(/^I am on the homepage$/) do
  visit '/'
end

When(/^I register to play the game$/) do
  fill_in 'player_name', with: 'Nick'
  click_button 'Register'
end

Then(/^I should wait for another player to join$/) do
  expect(page).to have_content 'Waiting for second player!'
end