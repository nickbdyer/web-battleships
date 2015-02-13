def place_patrol_boat(player)
  patrol_boat                  = Ship.patrol_boat
  patrol_boat_origin           = (params[:ship_one_xaxis] + params[:ship_one_yaxis]).to_sym
  patrol_boat_orientation      = params[:ship_one_orientation].to_sym
  player.board.place(Ship.patrol_boat, patrol_boat_origin, patrol_boat_orientation)
end

def place_submarine(player)
  submarine                    = Ship.submarine
  submarine_origin             = (params[:ship_two_xaxis] + params[:ship_two_yaxis]).to_sym
  submarine_orientation        = params[:ship_two_orientation].to_sym
  player.board.place(Ship.submarine, submarine_origin, submarine_orientation)
end

def place_destroyer(player)
  destroyer                    = Ship.destroyer
  destroyer_origin             = (params[:ship_three_xaxis] + params[:ship_three_yaxis]).to_sym
  destroyer_orientation        = params[:ship_three_orientation].to_sym
  player.board.place(Ship.destroyer, destroyer_origin, destroyer_orientation)
end    

def place_battleship(player)
  battleship                   = Ship.battleship
  battleship_origin            = (params[:ship_four_xaxis] + params[:ship_four_yaxis]).to_sym
  battleship_orientation       = params[:ship_four_orientation].to_sym
  player.board.place(Ship.battleship, battleship_origin, battleship_orientation)
end

def place_aircraft_carrier(player)
  aircraft_carrier             = Ship.aircraft_carrier
  aircraft_carrier_origin      = (params[:ship_five_xaxis] + params[:ship_five_yaxis]).to_sym
  aircraft_carrier_orientation = params[:ship_five_orientation].to_sym
  player.board.place(Ship.aircraft_carrier, aircraft_carrier_origin, aircraft_carrier_orientation)
end

def place_ships(player)
  place_patrol_boat(player)
  place_submarine(player)
  place_destroyer(player)
  place_battleship(player)
  place_aircraft_carrier(player)
end

