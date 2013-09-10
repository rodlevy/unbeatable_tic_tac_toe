class Computer

HUMAN = "X"
COMPUTER = "O"

	attr_accessor :best_move, :sub_alpha

	def initialize
		@sub_alpha = []
		@best_move = 0
	end

	def computer_move(board)
		if board.player_moves > board.computer_moves
			computers_move(board)
			# random_fill(board)
		end
	end

	def random_fill(board)
		size = board.grid.length
		random_spot = (0..size).to_a.sample
		if board.unoccupied(random_spot)
			board.store_position(random_spot, COMPUTER)
		else
			random_fill(board)
		end
	end

	def computers_move(board)
		minimax(board, COMPUTER)
		board.store_position(@best_move, COMPUTER)
	end

	def minimax(board, current_player)
		minimax_recurse(board, current_player, 0)
	end

	def minimax_recurse(board, player, depth)
		if player == HUMAN && board.winner?(player)
			puts "<<<<<<<<<<<<"
			return 1
		elsif player == COMPUTER && board.winner?(player)
			puts ">>>>>>>>>>>>"
			return -1

		elsif board.tie?
			return 0
		end
		# next_player = (player == COMPUTER ? HUMAN : COMPUTER )
		next_player = board.take_turn(board.current_player)
		possible_moves = board.get_move_list(board.grid)
		print possible_moves, "\n"
		possible_moves.each do |move|
			new_board = board.dup
			print "\n", move
			print new_board.grid
			next_board = new_board.simulate_move(new_board, move, player)
			@sub_alpha << minimax_recurse(next_board, next_player, depth + 1)
			end
			print @sub_alpha
	end

end
