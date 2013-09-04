class Computer

	def first_move(board)
		if board.unoccupied(4)		#always take center first
			board.store_position(4, "computer")
		else
			board.store_position(0, "computer") #otherwise top corner
		end
	end

	def second_move(board)
		if board.same_player_opposite_corners("X")
			board.store_position(3, "computer")
		elsif board.left_top_corner_computer_bottom_rt_player
		 	board.store_position(2, "computer")
		elsif board.unoccupied(0)
		 	board.store_position(0, "computer")
		else
		 	board.store_position(8, "computer")
		end
	end

	def computer_move(board)
		player_moves = board.player_moves
		first_move(board) if player_moves == 1
		if player_moves >= 2
			board.check_participant_win("O")
			board.check_participant_win("X") if board.computer_moves < board.player_moves
				if board.computer_moves < board.player_moves
					if player_moves == 2
						second_move(board)
					end
					if player_moves == 3 && board.edge_case
						board.store_position(6, "computer")
					end
				end
			if player_moves > board.computer_moves
				board.random_fill
			end
		end
	end



end
