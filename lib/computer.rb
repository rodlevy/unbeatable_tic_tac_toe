class Computer

HUMAN = "X"
COMPUTER = "O"

	def computer_move(board)
		if board.player_moves > board.computer_moves
			random_fill(board)
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

end
