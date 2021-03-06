class Board

HUMAN = "X"
COMPUTER = "O"

	attr_accessor :grid, :size, :possible_boards, :player

	def initialize(grid_size)
		@grid = Array.new(grid_size)
		@size = @grid.length
		@possible_boards = []
	end

	def winning_possibilities
		if grid.length == 9
			[[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
		elsif grid.length == 16
			[[0,1,2,3], [4,5,6,7], [8,9,10,11],[12,13,14,15], [0,5,10,15], [3,6,9, 12], [0,4,8,12], [1,5,9,13], [2,6,10,14], [3,7,11,15]]
		elsif grid.length == 25
			[[0,1,2,3,4], [5,6,7,8,9],[10,11,12,13,14],[15,16,17,18,19], [20,21,22,23,24,25], [0,5,10,15,20], [1,6,11,16,21], [2,7,12,17,22], [3,8,13,18,23],[4,9,14,19,24], [0,6,12,18,24],[4,8,12,16,20]]
		end
	end

	def winner?(player)
		if grid.length == 9
			winning_possibilities.each do |win|
				if grid[win[0]] == player && grid[win[1]] == player && grid[win[2]] == player
					return true
				end
			end
		elsif grid.length == 16
			winning_possibilities.each do |win|
				if grid[win[0]] == player && grid[win[1]] == player && grid[win[2]] == player && grid[win[3]] == player
					return true
				end
			end
		elsif grid.length == 25
			winning_possibilities.each do |win|
				if grid[win[0]] == player && grid[win[1]] == player && grid[win[2]] == player && grid[win[3]] == player && grid[win[4]] == player
					return true
				end
			end
		end
		false
	end

	def tie?
		if (player_moves + computer_moves) == grid.length && !winner?("X") && !winner?("O")
			true
		else
			false
		end
	end

	def occupied?(grid, location)
		grid[location].nil? ? false : grid[location]
	end

	def get_move_list(grid)
		grid.each_index.select{|index| grid[index].nil?}
	end

	def unoccupied(position)
		@grid[position].nil?
	end

	def take_turn(player)
		player == HUMAN ? COMPUTER : HUMAN
	end

	def store_position(position, participant)
		@grid[position] = participant
	end

	def simulate_move(board, position, player)
		board.grid[position] = player
		board
	end

	def current_player
		@grid.count(HUMAN) > @grid.count(COMPUTER) ? COMPUTER : HUMAN
	end

	def player_moves
		@grid.count(HUMAN)
	end

	def computer_moves
		@grid.count(COMPUTER)
	end

end
