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

	def check_computer_win
		 9.times do |i|
				if unoccupied(i)
					store_position(i, "computer")
					if victory_check("O")
						return true
					else
						remove_position(i)
					end
				end
			end
	end

	def check_player_win
		 9.times do |i|
				if unoccupied(i)
					store_position(i, "player")
					if victory_check("X")
						store_position(i, "computer")
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

