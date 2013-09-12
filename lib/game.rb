class Game

HUMAN = "X"
COMPUTER = "O"

	attr_accessor :position

	def initialize(interface, computer)
		@interface = interface
		@computer = computer
	end

	def check_within_range(position, grid_length)
		if position == "0"
			true
		elsif position.to_i < grid_length && position.to_i > 0
			true
		else
			false
		end
	end

	def check_space_unoccupied(position)
		@board.unoccupied(position)
	end

	def validate_input(inputted_position, grid)
		end_of_grid = grid.length

		until check_within_range(inputted_position, end_of_grid)
			@interface.reject(inputted_position)
			@interface.prompt
			inputted_position = @interface.user_input
		end

		until check_space_unoccupied(inputted_position.to_i)
			@interface.denied
			@interface.prompt
			inputted_position = @interface.user_input
		end

		inputted_position.to_i
	end

	def game_over
		(@board.tie? || @board.winner?(COMPUTER) || @board.winner?(HUMAN))
	end

	def check_board_after_computer_move
		if @board.winner?("O") == true
			@interface.computer_wins
			@interface.pretty_print_board(@board.grid)

		elsif @board.tie?
			@interface.cats_game
		end
	end

	def play
		@board = @board || Board.new(@interface.grid_size)

		until game_over

			@interface.pretty_print_board(@board.grid)
			@interface.prompt
			position = validate_input(@interface.user_input, @board.grid)

			@board.store_position(position, HUMAN)

			if @board.tie?
				@interface.cats_game
			end

			if @board.winner?("X") == true
				@interface.player_wins
				@interface.pretty_print_board(@board.grid)
			else
				@computer.computer_move(@board)
				check_board_after_computer_move
			end

		end
	end

end


