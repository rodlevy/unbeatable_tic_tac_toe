require_relative 'tic_tac_toe'
require 'pry'

class Game
	attr_accessor :position

	def initialize
		@game = Board.new
	end

	def prompt
		puts "Where do you want to place your X?"
		@position =  gets.chomp.to_i
	end

	def play
		@game.print_board
		prompt
		if !@game.unoccupied(@position)
			puts "Already occupied, try again"
			play
		end
		@game.store_position(@position, "player")
		if @game.player_moves + @game.computer_moves == 9
			puts "CATS GAME!"
			return
		end
		if @game.victory_check("X") == true
			puts "X Wins"
		else
			computer_move
			if @game.victory_check("Y") == true
				puts "Computer Wins"
				@game.print_board
				return
			end
			play
		end
	end

	def computer_move
		player_moves = @game.player_moves
		# binding.pry
		if player_moves == 1
			if @game.unoccupied(4)		#always take center first
				@game.store_position(4, "computer")
			else
				@game.store_position(0, "computer") #otherwise top corner
			end
		end

		if player_moves >= 2
			@game.check_computer_win
			@game.check_player_win if @game.computer_moves < @game.player_moves
				if @game.computer_moves < @game.player_moves
					# check both corners, all other cases where 'x' has a corner are covered by check_player_win
					if player_moves == 2 && (@game.position(0) == "X" && @game.position(8) == "X" ||
											@game.position(2) == "X" && @game.position(6) == "X")
						@game.store_position(3, "computer")

					# if center is x, left corner must be y, check against bottom rt corner x (all other
					#	cases where 'x' is center are covered by the check_player_win)
					elsif player_moves == 2 && (@game.position(0) == "Y" && @game.position(8) == "X")
						@game.store_position(3, "computer")
					else #if we made it here, 'x' has not taken a corner or center
						@game.store_position(0, "computer")
					end
					#edge case --
					if player_moves == 3 && (@game.position(1) == "X" && @game.position(3) == "X" &&
											@game.position(8) == "X")
						@game.store_position(6, "computer")
					end
				end
		end
	end


end


