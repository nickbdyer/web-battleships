#Web Battleships 

[![Code
Climate](https://codeclimate.com/github/nickbdyer/web-battleships/badges/gpa.svg)](https://codeclimate.com/github/nickbdyer/web-battleships)
[![Test
Coverage](https://codeclimate.com/github/nickbdyer/web-battleships/badges/coverage.svg)](https://codeclimate.com/github/nickbdyer/web-battleships)

Week 3 at Makers Academy

##The Problem

Following on from the week 2 challenge of creating the [logic for the game
battleships](https://github.com/Callisto13/Battleships). The challenge this
week was to extend that further by creating a hosted frontend using Sinatra.
Sinatra was used rather than Rails, in an effort to introduce effectively the
concept of servers and linking the frontend to the backend.

##Method
As ever this was a test driven exercise, using Cucumber and Capybara for
acceptance testing, and RSpec for unit testing. The code base from Week 2 was
good, but had a lot of holes in it. For that reason, a code base provided by
one of the coaches was used in order to get the most from the learning
experience. I did not want to be held back by logic issues, when the real value
in this week was learning about acceptance testing and Sinatra. 

One of the issues encountered related to sessions, and organising the system so
that two players could join and also players could be notified that they had
won or lost the game. 

##Solution

The final solution at the end of the week was functional if using the "happy
path". However, a lot could be done to improve it. I also learned a lot this
week about getting projects up to Heroku rather than just running a local
server. 

##Hosted

Please click [here](https://protected-garden-5002.herokuapp.com/) to be taken
to the project hosted on Heroku. 

##Images
Registration: 
![alt text](images/signup.png
"Sign Up")

Placing Ships: 
![alt text](images/placeships.png
"Place Ships")

Playing: 
![alt text](images/gameplay.png
"In Game Footage!")

##Improvements

- Use my own backend, rather than the coach's. 
- Improve the CSS
- Allow players to place one ship at a time, and see each ship as it is placed. 
- Allow more than 1 game to occur at a time.


