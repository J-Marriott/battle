require 'sinatra/base'
require_relative './lib/game'
require_relative './lib/player'
require_relative './lib/computer'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    player_1 = Player.new(params[:player1])
    if params[:player2] == ""
        player_2 = Computer.new
      else
        player_2 = Player.new(params[:player2])
      end
    Game.new(player_1,player_2)
    redirect '/play'
  end

  get '/play' do
    game = Game.instance
    @player_1_name   = game.player_1.name
    @player_2_name   = game.player_2.name
    @player_1_health = game.player_1.health
    @player_2_health = game.player_2.health
    @active_player_name = game.active_player.name
    erb :play
  end

  post '/attack' do
    game = Game.instance
    opponent = game.opponent_of
    game.attack opponent
    @opponent_name = opponent.name
    redirect '/winner' if opponent.health <= 0
    if @opponent_name == "HAL"
      game.attack(game.player_1)
      (game.switch; redirect '/winner') if game.player_1.health <=0
    else
      game.switch
    end
    erb :attack
  end

  get '/winner' do
    game = Game.instance
    @winner = game.active_player.name
    erb :winner
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
