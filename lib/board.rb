class Board

HUMAN = "X"
COMPUTER = "O"

	attr_accessor :grid, :size, :possible_boards, :player

	def initialize(grid_size)
		@grid = (0..(grid_size - 1)).to_a
		@size = @grid.length
		@possible_boards = []
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
	def make_possible_boards(current_board, player, depth)
		possible_boards << current_board
		next_board = current_board.dup
		next_board[depth] = player unless depth == (size)
		print current_board
		puts "|||||||||||||||"
		puts depth
		if depth == (size)
			depth -= 1
			puts depth
			puts player

			puts "POSSIBLE BOARDS"
			print possible_boards
			print "NEXT BOARD\n"
			print next_board
			print "\n>>>>>>>>>>>>>>>"
			if possible_boards.include?(next_board)
				puts "____________"
				print next_board
				puts "____________"

				depth -= 1
				player = take_turn(player)
				next_board[depth] = player
				print possible_boards
				puts ""
				print "*******"
				print next_board
				print "ENNDDD"
				if depth < (size - 1)
					depth += 1
					player = take_turn(player)
					unless possible_boards.include?(next_board)
					make_possible_boards(next_board, player, depth)
					end
				end
			end
			depth = 50
		end

		if depth < (size)
			depth += 1
			player = take_turn(player)
			puts "IM HEERRREEE"
			make_possible_boards(next_board, player, depth)
		end

	end

	def winning_possibilities
		if grid.length == 9
			[[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
		elsif grid.length == 16
			[[0,1,2,3], [4,5,6,7], [8,9,10,11],[12,13,14,15], [0,5,10,15], [3,6,9, 12], [0,4,8,12], [1,5,9,13], [2,6,10,14], [3,7,11,15]]
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
		grid[location].class == Fixnum ? false : grid[location]
	end

	def unoccupied(position)
		@grid[position].class == Fixnum
	end

	def take_turn(player)
		player == HUMAN ? COMPUTER : HUMAN
	end

	def store_position(position, participant)
		@grid[position] = participant
	end

	def check_participant_win(participant)
		player = (participant == HUMAN ? "player" : "computer")
		 9.times do |i|
				if unoccupied(i)
					store_position(i, player)
					if winner?(participant)
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

	def player_moves
		@grid.count(HUMAN)
	end

	def computer_moves
		@grid.count(COMPUTER)
	end

end
