class Battleships < Sinatra::Base

  before '/waiting' do 
    @player = GAME.players.select { |player| player.object_id == session[:me] }.first
  end

  post '/waiting' do

    place_patrol_boat(@player)
    place_submarine(@player)
    place_destroyer(@player)
    place_battleship(@player)
    place_aircraft_carrier(@player)

    redirect('/play') if GAME.ready?

    erb :waiting, :layout => :layout_refresh

  end

  get '/waiting' do
    redirect('/play') if GAME.ready?
    erb :waiting, :layout => :layout_refresh
  end    

end
