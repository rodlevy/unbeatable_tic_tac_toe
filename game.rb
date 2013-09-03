require_relative 'tic_tac_toe'
require './interface.rb'
require 'pry'

class Game
	attr_accessor :position

	def initialize
		@board = Board.new
		@interface = Interface.new
	end

	# def prompt
	# 	position = gets.chomp
	# 	@position = check(position)
	# end

	def check(position)
		if position == "0"
			return position.to_i
		elsif position.to_i < 9 && position.to_i > 0
			return position.to_i
		else
			@interface.reject(position)
			false
		end
	end

	def play
		@interface.pretty_print_board(@board.grid)
		@position = check(@interface.prompt)

		 if !@position
				play
		end
		if !@board.unoccupied(@position)
			@interface.denied
			play
		end
		@board.store_position(@position, "player")
		if @board.player_moves + @board.computer_moves == 9
			@interface.cats_game
			return
		end
		if @board.victory_check("X") == true
			puts "X Wins"
		else
			computer_move
			if @board.victory_check("O") == true
				@interface.computer_wins
				@interface.pretty_print_board(@board.grid)
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

	def second_move
		if @board.same_player_opposite_corners("X")
			@board.store_position(3, "computer")
		elsif @board.left_top_corner_computer_bottom_rt_player
		 	@board.store_position(2, "computer")
		elsif @board.unoccupied(0)
		 	@board.store_position(0, "computer")
		else
		 	@board.store_position(8, "computer")
		end
	end

	def computer_move
		player_moves = @board.player_moves
		first_move if player_moves == 1
		if player_moves >= 2
			@board.check_participant_win("O")
			@board.check_participant_win("X") if @board.computer_moves < @board.player_moves
				if @board.computer_moves < @board.player_moves
					if player_moves == 2
						second_move
					end
					if player_moves == 3 && @board.edge_case
						@board.store_position(6, "computer")
					end
				end
			if player_moves > @board.computer_moves
				@board.random_fill
			end
		end
	end


end


