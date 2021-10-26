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


# puts "Welcome to Battleship"
# puts "Enter p to play. Enter q to quit"
# response = gets.chomp.downcase
# until response == "q"
# end
