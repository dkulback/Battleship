require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

loop do
  game = Game.new
  game.generator
  game.welcome_message
  game.turns
  game.game_over
end
