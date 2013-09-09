# require 'board'
# require 'interface'
require 'pry'

class Game

HUMAN = "X"
COMPUTER = "O"

	attr_accessor :position

	def initialize(interface, computer)
		@interface = interface
		@computer = computer
	end

	def check(position, grid)
		end_of_grid = grid.length
		if position == "0"
			return position.to_i
		elsif position.to_i < end_of_grid && position.to_i > 0
			return position.to_i
		else
			@interface.reject(position)
			false
		end
	end

	def play
		@board = @board || Board.new(@interface.grid_size)
		@interface.pretty_print_board(@board.grid)
		@position = check(@interface.prompt, @board.grid)

		 if !@position
				play
		end
		if !@board.unoccupied(@position)
			@interface.denied
			play
		end
		@board.store_position(@position, HUMAN)
		if @board.tie?
			@interface.cats_game
			return
		end
		if @board.winner?("X") == true
			@interface.player_wins
			@interface.pretty_print_board(@board.grid)
		else
			@computer.computer_move(@board)
			if @board.winner?("O") == true
				@interface.computer_wins
				@interface.pretty_print_board(@board.grid)
				return
			end
			play
		end
	end

end


