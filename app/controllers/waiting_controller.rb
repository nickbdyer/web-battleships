class Battleships < Sinatra::Base

  post '/waiting' do

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

end
