class Board

	attr_accessor :board

	def initialize
		@board = (0..8).to_a
	end

	def print_board
		puts "0 1 2"
		puts "3 4 5"
		puts "6 7 8"
		puts " "
		@board.each_slice(3) {|row| p row.map{|cell| cell.class == Fixnum ? '-' : cell}}
	end

	def store_position(position, participant)
		if participant == "player"
			@board[position] = "X"
		else
			@board[position] = "Y"
		end
	end

	def position(position)
		@board[position]
	end

	def remove_position(position)
		@board[position] = position
	end

	def unoccupied(position)
		@board[position].class == Fixnum
	end

	def player_moves
		@board.count("X")
	end

	def computer_moves
		@board.count("Y")
	end

	def check_computer_win
		 9.times do |i|
				if unoccupied(i)
					store_position(i, "computer")
					if victory_check("Y")
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
		if @board[0] == player && @board[1] == player && @board[2] == player or
			@board[3] == player && @board[4] == player && @board[5] == player or
			@board[6] == player && @board[7] == player && @board[8] == player or
			@board[0] == player && @board[3] == player && @board[6] == player or
			@board[1] == player && @board[4] == player && @board[7] == player or
			@board[2] == player && @board[5] == player && @board[8] == player or
			@board[0] == player && @board[4] == player && @board[8] == player or
			@board[2] == player && @board[4] == player && @board[6] == player
			true
		end
	end

end

