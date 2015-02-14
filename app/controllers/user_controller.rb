class Battleships < Sinatra::Base

  post '/register_player' do
    session[:game_id] = GAME.object_id

    add_player_to_game(GAME)

    session[:me] = @player.object_id
  
    if GAME.ready?
      redirect '/'
    else
      erb :place_ships
    end
  end

end
