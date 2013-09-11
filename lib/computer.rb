class Computer

HUMAN = "X"
COMPUTER = "O"
MAX_DEPTH = 3 #to control length of calc time

	attr_accessor :best_move, :sub_alpha, :active_player

	def initialize
		@sub_alpha = []
		@best_move = 0
		@best_moves =[]
	end

	# def set_max_depth
	# 	@max_depth = (grid_size == 25 ? 3 : 5)
	# end

	def computer_move(board)
		if board.player_moves > board.computer_moves
			@active_player = COMPUTER
			computers_move(board)
		end
	end

	def computers_move(board)
		if board.computer_moves == 0
			if board.unoccupied(6)
				board.store_position(6, COMPUTER)
			else
				board.store_position(8, COMPUTER)
			end
		else
			minimax(board, @active_player)
			board.store_position(@best_move, @active_player)
		end
	end

	def minimax(board, current_player)
		minimax_recurse(board, current_player, 0)
	end

	def check_winner(board, depth)
		winner = 'None'
		winner = COMPUTER if board.winner?(COMPUTER)
		winner = HUMAN if board.winner?(HUMAN)
		winner = 'tie' if board.tie?
		winner = 'tie' if depth >= MAX_DEPTH
		winner
	end


	def minimax_recurse(board, player, depth)

		winner = check_winner(board, depth)
		unless winner == 'None'
			if winner == 'tie'
				return 0
			elsif winner ==	@active_player
				return 1
			else
				return -1
			end
		end

		next_player = (player == COMPUTER ? HUMAN : COMPUTER )

		if player == @active_player
			alpha = -1
		else
			alpha = 1
		end

		possible_moves = board.get_move_list(board.grid)

		# print "MOVES LEFT:", possible_moves, "\n"

		possible_moves.each_with_index do |move, index|
			new_board = board.dup
			new_board.grid = board.grid.dup
			# print "\n, MOVE: ", move
			# print new_board.grid
			# print "\n PLAYER ", player
			next_board = new_board.simulate_move(new_board, move, player)
			# print "\n NEXT BOARD", next_board.grid
			# print "\n DEPTH: ", depth
			@sub_alpha = minimax_recurse(next_board, next_player, depth + 1)

			# print "BEST MOVE SO FAR: ", @best_move," sub_alpha: ", @sub_alpha, "***"
			if player == @active_player
				if ((depth == 0 ) && (alpha <= @sub_alpha ))
					@best_move = move
					@best_moves << best_move
				end
				alpha = [alpha, @sub_alpha].max
			else
				alpha = [alpha, @sub_alpha].min
			end
			# print "BEST MOVE FINAL:", @best_move,"sub_alpha: ", @sub_alpha, "***"
		end
		# print "ALPHA: ", alpha
		alpha
	end

end
