require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base

  get '/' do
    erb(:index)
  end

  post '/names' do
    @player_1 = Player.new(params[:Player1])
    @player_2 = Player.new(params[:Player2])
    $game = Game.new(@player_1, @player_2)
    redirect '/play'
  end

  get '/play' do
    @attack = $attack
    @player_1 = $game.player_1.name
    @player_2 = $game.player_2.name
    erb(:play)
  end

  post '/attack' do
    $attack = !!params[:attack]
    @player_1 = $game.player_1
    @player_2 = $game.player_2
    # @current_player = $game.current_player
    $game.attack($game.enemy_player)
    $game.switch_turn
    redirect '/play'
  end
  #
  # get '/switch_turn' do
  #   redirect '/attack'
  # end


  run! if app_file == $0
end
