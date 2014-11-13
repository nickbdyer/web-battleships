require 'capybara'

def in_browser(name)
  old_session = Capybara.session_name

  Capybara.session_name = name
  yield

  Capybara.session_name = old_session
end

Given(/^I am on the homepage$/) do
  in_browser(:one) do
    visit '/'
  end
end

When(/^I register to play the game$/) do
  in_browser(:one) do
    fill_in 'player_name', with: 'Nick'
    click_button 'Register'
  end
end

When(/^Another player registers to play the game$/) do
  in_browser(:two) do
    fill_in 'player_name', with: 'Ben'
    click_button 'Register'
  end
end

Then(/^I should be asked to enter some ships$/) do
  in_browser(:one) do
    expect(page).to have_content ("Please enter the coordinates and orientation of the ships you want to place.")
  end
end

Given(/^I have registered$/) do
  in_browser(:one) do
    step("I register to play the game")
    expect(page).to have_content ("Please enter the coordinates and orientation of the ships you want to place.")
  end
end

Given(/^Another player has registered$/) do
  in_browser(:two) do
    visit '/'
    step("Another player registers to play the game")
  end
end

Given(/^I have placed my ships$/) do
  visit '/reset_game'
  in_browser(:one) do
    visit '/'
    fill_in 'player_name', with: 'Nick'
    click_on 'Register'
    select('A', from: 'ship_one_xaxis')
    select('1', from: 'ship_one_yaxis')
    select('horizontally', from: 'ship_one_orientation')
    select('B', from: 'ship_two_xaxis')
    select('1', from: 'ship_two_yaxis')
    select('horizontally', from: 'ship_two_orientation')
    select('C', from: 'ship_three_xaxis')
    select('1', from: 'ship_three_yaxis')
    select('horizontally', from: 'ship_three_orientation')
    select('D', from: 'ship_four_xaxis')
    select('1', from: 'ship_four_yaxis')
    select('horizontally', from: 'ship_four_orientation')
    select('E', from: 'ship_five_xaxis')
    select('1', from: 'ship_five_yaxis')
    select('horizontally', from: 'ship_five_orientation')
    click_button 'Place Ships'
  end
end

Given(/^Another player has placed their ships$/) do
  in_browser(:two) do
    visit '/'
    fill_in 'player_name', with: 'Ben'
    click_on 'Register'
    select('A', from: 'ship_one_xaxis')
    select('1', from: 'ship_one_yaxis')
    select('horizontally', from: 'ship_one_orientation')
    select('B', from: 'ship_two_xaxis')
    select('1', from: 'ship_two_yaxis')
    select('horizontally', from: 'ship_two_orientation')
    select('C', from: 'ship_three_xaxis')
    select('1', from: 'ship_three_yaxis')
    select('horizontally', from: 'ship_three_orientation')
    select('D', from: 'ship_four_xaxis')
    select('1', from: 'ship_four_yaxis')
    select('horizontally', from: 'ship_four_orientation')
    select('E', from: 'ship_five_xaxis')
    select('1', from: 'ship_five_yaxis')
    select('horizontally', from: 'ship_five_orientation')
    click_button 'Place Ships'
  end
end

Given(/^I am waiting for another player to join$/) do
  in_browser(:one) do
    expect(page).to have_content 'Waiting for second player, Nick!'
  end
end

When(/^Another player joins$/) do
  in_browser(:two) do
    step("Another player has placed their ships")
  end
end

Then(/^the second player should go straight to the game page$/) do
  in_browser(:two) do
    expect(page).to have_content("Play Game")
  end
end


