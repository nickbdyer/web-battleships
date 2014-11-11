require 'sinatra/base'

class Battleships < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/register_player' do
    erb :waiting
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
