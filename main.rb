$: << File.expand_path(File.dirname(__FILE__) + "/lib")

# puts $:
require 'game'
require 'board'
require 'interface'
require 'computer'

new_board = Board.new
new_interface = Interface.new
new_computer = Computer.new

fun_game = Game.new(new_board, new_interface, new_computer)
fun_game.play