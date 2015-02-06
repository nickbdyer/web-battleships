class Battleships < Sinatra::Base

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

end
