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

    submarine                    = Ship.submarine
    submarine_origin             = (params[:ship_two_xaxis] + params[:ship_two_yaxis]).to_sym
    submarine_orientation        = params[:ship_two_orientation].to_sym
    @player.board.place(Ship.submarine, submarine_origin, submarine_orientation)

    destroyer                    = Ship.destroyer
    destroyer_origin             = (params[:ship_three_xaxis] + params[:ship_three_yaxis]).to_sym
    destroyer_orientation        = params[:ship_three_orientation].to_sym
    @player.board.place(Ship.destroyer, destroyer_origin, destroyer_orientation)
    
    battleship                   = Ship.battleship
    battleship_origin            = (params[:ship_four_xaxis] + params[:ship_four_yaxis]).to_sym
    battleship_orientation       = params[:ship_four_orientation].to_sym
    @player.board.place(Ship.battleship, battleship_origin, battleship_orientation)

    aircraft_carrier             = Ship.aircraft_carrier
    aricraft_carrier_origin      = (params[:ship_five_xaxis] + params[:ship_five_yaxis]).to_sym
    aricraft_carrier_orientation = params[:ship_five_orientation].to_sym
    @player.board.place(Ship.aircraft_carrier, aricraft_carrier_origin, aricraft_carrier_orientation)

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
    begin
      GAME.shoots(shot_coords) 
      redirect '/play'
    rescue
      redirect '/play'
    end
    
  end

  get '/reset_game' do
    GAME = Game.new
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end



