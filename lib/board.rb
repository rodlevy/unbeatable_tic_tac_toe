class Board

PLAYER = "X"
COMPUTER = "O"

	attr_accessor :grid, :size

	def initialize(grid_size)
		@grid = (0..(grid_size - 1)).to_a
	end

# for a given round (9 rounds in 3x3)
# determine whose turn it is (x or o),
# make a duplicate board
# # fill the first available spot
# check for win?
# if no win, store the state of the board, the current depth, the board_score(1,0,-1), and the parent state
# 	go make another move, repeat from check for win
# 	keep going until win

# repeat for other children of that node, filling the next move until all wins are found



	def check_participant_win(participant)
		player = (participant == PLAYER ? "player" : "computer")
		 9.times do |i|
				if unoccupied(i)
					store_position(i, player)
					if victory_check(participant)
						if participant == COMPUTER
							return true
						else
							store_position(i, "computer")
						end
					else
						remove_position(i)
					end
				end
			end
	end


	def winning_possibilities
		if grid.length == 9
			[[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
		end
	end

	def winner?(player)
		winning_possibilities.each do |win|
			if grid[win[0]] == player && grid[win[1]] == player && grid[win[2]] == player
				return true
			end
		end
	end

	def occupied?(grid, location)
		grid[location].class == Fixnum ? false : grid[location]
	end

	def take_turn(player)
		player == "X" ? "O" : "X"
	end

	def store_position(position, participant)
		if participant == "player"
			@grid[position] = PLAYER
		else
			@grid[position] = COMPUTER
		end
	end

	# def victory_check(player)
	# 	if @grid[0] == player && @grid[1] == player && @grid[2] == player or
	# 		@grid[3] == player && @grid[4] == player && @grid[5] == player or
	# 		@grid[6] == player && @grid[7] == player && @grid[8] == player or
	# 		@grid[0] == player && @grid[3] == player && @grid[6] == player or
	# 		@grid[1] == player && @grid[4] == player && @grid[7] == player or
	# 		@grid[2] == player && @grid[5] == player && @grid[8] == player or
	# 		@grid[0] == player && @grid[4] == player && @grid[8] == player or
	# 		@grid[2] == player && @grid[4] == player && @grid[6] == player
	# 		true
	# 	end
	# end

	# def position(position)
	# 	@grid[position]
	# end

	# def remove_position(position)
	# 	@grid[position] = position
	# end

	# def unoccupied(position)
	# 	@grid[position].class == Fixnum
	# end

	# def player_moves
	# 	@grid.count(PLAYER)
	# end

	# def computer_moves
	# 	@grid.count(COMPUTER)
	# end

	# def random_fill
	# 	i = 0
	# 	until unoccupied(i)
	# 		i += 1
	# 	end
	# 	store_position(i, "computer")
	# end
end
