require 'sinatra/base'
require_relative '../lib/player'
require_relative '../lib/game'
require_relative '../lib/board'
require_relative '../lib/cell'
require_relative '../lib/ship'
require_relative '../lib/water'

class Battleships < Sinatra::Base

  set :public_folder, Proc.new { File.join(root, "..", "public") }
  enable :sessions
  GAME = Game.new

  get '/' do
    erb :index
  end

  post '/register_player' do
    session[:game_id] = GAME.object_id

    @player = Player.new
    @player.name = params[:player_name]
    @player.board = Board.new(Cell, Water)
    GAME.add_player(@player)

    session[:me] = @player.object_id
  
    if GAME.ready?
      redirect '/'
    else
      erb :place_ships
    end
  end


  post '/waiting' do

    # puts '==' * 30
    # puts GAME.player1.object_id
    # puts GAME.player2.object_id
    # puts GAME.players.map{|player| player.object_id}.inspect

    # puts session[:me].inspect

    @player = GAME.players.select { |player| player.object_id == session[:me] }.first

    patrol_boat                  = Ship.patrol_boat
    patrol_boat_origin           = (params[:ship_one_xaxis] + params[:ship_one_yaxis]).to_sym
    patrol_boat_orientation      = params[:ship_one_orientation].to_sym
    @player.board.place(Ship.patrol_boat, patrol_boat_origin, patrol_boat_orientation)

   

    redirect('/play') if GAME.ready?

    erb :waiting, :layout => :layout_refresh

  end

  get '/waiting' do
    redirect('/play') if GAME.ready?
    @player = GAME.players.select { |player| player.object_id == session[:me] }.first
    erb :waiting, :layout => :layout_refresh
  end    

  get '/play' do
    @player = GAME.players.select { |player| player.object_id == session[:me] }.first
    @opponent = GAME.players.select { |player| player.object_id != session[:me] }.first
    erb :play, :layout => :layout_refresh
  end

  post '/play' do
    @player = GAME.players.select { |player| player.object_id == session[:me] }.first
    @opponent = GAME.players.select { |player| player.object_id != session[:me] }.first
    shot_coords = (params[:x_coords] + params[:y_coords]).to_sym
    GAME.shoots(shot_coords) 
    redirect '/play'
  end

  get '/reset_game' do
    GAME = Game.new
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end



