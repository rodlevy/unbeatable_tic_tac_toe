require_relative 'tic_tac_toe'
require 'pry'

class Game
	attr_accessor :position

	def initialize
		@board = Board.new
	end

	def prompt
		position = gets.chomp
		@position = check(position)
	end

	def check(position)
		if position == "0"
			return position.to_i
		elsif position.to_i < 9 && position.to_i > 0
			return position.to_i
		else
			puts "#{position} isnt no good"
			false
		end

	end

	def play
		@board.print_board
		puts "Where do you want to place your X?"
		prompt
		 if !@position
				play
		end
		if !@board.unoccupied(@position)
			puts "Already occupied, try again"
			play
		end
		@board.store_position(@position, "player")
		if @board.player_moves + @board.computer_moves == 9
			puts "CATS GAME!"
			return
		end
		if @board.victory_check("X") == true
			puts "X Wins"
		else
			computer_move
			if @board.victory_check("O") == true
				puts "Computer Wins"
				@board.print_board
				return
			end
			play
		end
	end

	def first_move
		if @board.unoccupied(4)		#always take center first
			@board.store_position(4, "computer")
		else
			@board.store_position(0, "computer") #otherwise top corner
		end

	end

	def computer_move
		player_moves = @board.player_moves
		first_move if player_moves == 1
		if player_moves >= 2
			@board.check_computer_win
			@board.check_player_win if @board.computer_moves < @board.player_moves
				if @board.computer_moves < @board.player_moves
					# check both corners, all other cases where 'x' has a corner are covered by check_player_win
					if player_moves == 2 && (@board.position(0) == "X" && @board.position(8) == "X" ||
											@board.position(2) == "X" && @board.position(6) == "X")
						@board.store_position(3, "computer")

					# if center is x, left corner must be O, check against bottom rt corner x (all other
					#	cases where 'x' is center are covered by the check_player_win)
					elsif player_moves == 2 && (@board.position(0) == "O" && @board.position(8) == "X")
						@board.store_position(2, "computer")
					 #if we made it here, 'x' has not taken a corner or center
					elsif @board.unoccupied(0)
						@board.store_position(0, "computer")
					else
						@board.store_position(8, "computer")
					end
					#edge case --
					if player_moves == 3 && (@board.position(1) == "X" && @board.position(3) == "X" &&
											@board.position(8) == "X")
						@board.store_position(6, "computer")
					end
				end
		end
	end


end


