class Battleships < Sinatra::Base

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

end
