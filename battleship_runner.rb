require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

loop do
  game = Game.new
  game.comp_ship_generator
  game.welcome_message
  game.turns
  game.game_over
end
