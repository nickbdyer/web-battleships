require 'sinatra/base'
require_relative '../lib/player'
require_relative '../lib/game'
require_relative '../lib/board'
require_relative '../lib/cell'

class Battleships < Sinatra::Base

  GAME = Game.new

  get '/' do
    erb :index
  end

  post '/register_player' do
    @player = Player.new
    @player.name = params[:player_name]
    @player.board = Board.new(Cell)
    if GAME.ready?
      redirect '/play'
    else
      erb :place_ships
    end
  end

  post '/waiting' do
    
    erb :waiting
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
