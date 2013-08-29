class Board

	attr_accessor :grid

	def initialize
		@grid = (0..8).to_a
	end

	def print_board
		puts "0 1 2"
		puts "3 4 5"
		puts "6 7 8"
		puts " "
		@grid.each_slice(3) {|row| p row.map{|cell| cell.class == Fixnum ? '-' : cell}}
	end

	def same_player_opposite_corners(participant)
		(@grid[0] == @grid[8] || @grid[2] == @grid[6]) ? true : false
	end

	def left_top_corner_computer_bottom_rt_player
		# if center is x, left corner must be O, check against bottom rt corner x
		(@grid[0] == "O" && @grid[8] == "X") ? true :false
	end

	def edge_case
		@grid[1] == "X" && @grid[3] == "X" && @grid[8] == "X" ? true : false
	end

	def store_position(position, participant)
		if participant == "player"
			@grid[position] = "X"
		else
			@grid[position] = "O"
		end
	end

	def position(position)
		@grid[position]
	end

	def remove_position(position)
		@grid[position] = position
	end

	def unoccupied(position)
		@grid[position].class == Fixnum
	end

	def player_moves
		@grid.count("X")
	end

	def computer_moves
		@grid.count("O")
	end

	def random_fill
		i = 0
		until unoccupied(i)
			i += 1
		end
		puts i
		store_position(i, "computer")
	end

	def check_participant_win(participant)
		player = (participant == "X" ? "player" : "computer")
		 9.times do |i|
				if unoccupied(i)
					store_position(i, player)
					if victory_check(participant)
						if participant == "O"
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

	def victory_check(player)
		if @grid[0] == player && @grid[1] == player && @grid[2] == player or
			@grid[3] == player && @grid[4] == player && @grid[5] == player or
			@grid[6] == player && @grid[7] == player && @grid[8] == player or
			@grid[0] == player && @grid[3] == player && @grid[6] == player or
			@grid[1] == player && @grid[4] == player && @grid[7] == player or
			@grid[2] == player && @grid[5] == player && @grid[8] == player or
			@grid[0] == player && @grid[4] == player && @grid[8] == player or
			@grid[2] == player && @grid[4] == player && @grid[6] == player
			true
		end
	end

end

