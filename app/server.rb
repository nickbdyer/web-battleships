require 'sinatra/base'
require_relative '../lib/player'
require_relative '../lib/game'
require_relative '../lib/board'
require_relative '../lib/cell'

class Battleships < Sinatra::Base

  set :public_folder, Proc.new { File.join(root, "..", "public") }
  enable :sessions
  GAME = Game.new

  get '/' do
    puts session.inspect
    erb :index
  end

  post '/register_player' do
    puts session.inspect
    session[:game_id] = GAME.object_id

    player = Player.new
    player.name = params[:player_name]
    player.board = Board.new(Cell)
    GAME.add_player(player)

    session[:me] = player.object_id
  
    if GAME.ready?
      redirect '/'
    else
      erb :place_ships
    end
  end

  post '/waiting' do
    raise params.inspect
    redirect '/play' if GAME.ready?
    erb :waiting
  end

  get '/play' do
    erb :play
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end



    # session[:player1].nil? ? session[:player1] = @player.name : session[:player2] = @player.name
