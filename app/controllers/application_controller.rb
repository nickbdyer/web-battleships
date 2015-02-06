class Battleships < Sinatra::Base

  set :public_folder, Proc.new { File.join(root, "..", "..", "public") }
  set :views, Proc.new { File.join(root, "..", "views") }
  
  enable :sessions
  GAME = Game.new

  get '/' do
    erb :index
  end

  get '/reset_game' do
    GAME = Game.new
  end

  run! if app_file == $0
end



