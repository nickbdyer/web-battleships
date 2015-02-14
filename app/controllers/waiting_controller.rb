class Battleships < Sinatra::Base

  before '/waiting' do 
    @player = GAME.players.select { |player| player.object_id == session[:me] }.first
  end

  post '/waiting' do
    place_ships(@player)
    redirect('/play') if GAME.ready?
    erb :waiting, :layout => :layout_refresh
  end

  get '/waiting' do
    redirect('/play') if GAME.ready?
    erb :waiting, :layout => :layout_refresh
  end    

end
