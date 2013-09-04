2# require 'board'
# require 'interface'
require 'pry'

class Game
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
		@board = Board.new(@interface.board_size)
		@interface.pretty_print_board(@board.grid)
		@position = check(@interface.prompt, @board.grid)

		 if !@position
				play
		end
		if !@board.unoccupied(@position)
			@interface.denied
			play
		end
		@board.store_position(@position, "player")
		if @board.player_moves + @board.computer_moves == 9
			@interface.cats_game
			return
		end
		if @board.victory_check("X") == true
			@interface.player_wins
		else
			@computer.computer_move(@board)
			if @board.victory_check("O") == true
				@interface.computer_wins
				@interface.pretty_print_board(@board.grid)
				return
			end
			play
		end
	end

	# def first_move
	# 	if @board.unoccupied(4)		#always take center first
	# 		@board.store_position(4, "computer")
	# 	else
	# 		@board.store_position(0, "computer") #otherwise top corner
	# 	end
	# end

	# def second_move
	# 	if @board.same_player_opposite_corners("X")
	# 		@board.store_position(3, "computer")
	# 	elsif @board.left_top_corner_computer_bottom_rt_player
	# 	 	@board.store_position(2, "computer")
	# 	elsif @board.unoccupied(0)
	# 	 	@board.store_position(0, "computer")
	# 	else
	# 	 	@board.store_position(8, "computer")
	# 	end
	# end

	# def computer_move
	# 	player_moves = @board.player_moves
	# 	first_move if player_moves == 1
	# 	if player_moves >= 2
	# 		@board.check_participant_win("O")
	# 		@board.check_participant_win("X") if @board.computer_moves < @board.player_moves
	# 			if @board.computer_moves < @board.player_moves
	# 				if player_moves == 2
	# 					second_move
	# 				end
	# 				if player_moves == 3 && @board.edge_case
	# 					@board.store_position(6, "computer")
	# 				end
	# 			end
	# 		if player_moves > @board.computer_moves
	# 			@board.random_fill
	# 		end
	# 	end
	# end


end


