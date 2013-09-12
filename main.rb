$: << File.expand_path(File.dirname(__FILE__) + "/lib")

require 'game'
require 'board'
require 'interface'
require 'computer'

HUMAN = "X"
COMPUTER = "O"

fun_game = Game.new(Interface.new, Computer.new)
fun_game.play
