require 'sinatra/base'
require './lib/player'

class Battle < Sinatra::Base

  get '/' do
    erb(:index)
  end

  post '/names' do
    $player_1 = Player.new(params[:Player1])
    $player_2 = Player.new(params[:Player2])
    redirect '/play'
  end

  get '/play' do
    @attack = $attack
    @player_1 = $player_1
    @player_2 = $player_2
    erb(:play)
  end

  post '/attack' do
    $attack = !!params[:attack]
    Game.new.attack(@player_2)
    redirect '/play'
  end


  run! if app_file == $0
end
