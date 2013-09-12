class Interface

	def opening_prompt
		puts "What size board do you want to play (9, 16, 25)"
		size = gets.chomp
		size
	end

	def grid_size
		size = opening_prompt

		if size == "9" || size == "16" || size == '25'
			return size.to_i
		else
			puts "Please enter 9, 16 or 25"
			grid_size
		end

	end

	def axis_length(size)
		Math.sqrt(size).to_i
	end

	def insert_spaces(position, size, output, grid)
	   if position % axis_length(size) == (axis_length(size) - 1)
      	output << "\n" unless position == (size - 1)
      	else
      		if position < 10 || !grid[position].nil?
      			output << "   "
      		else
      			output << "  "
      	end
      end

	end

	def pretty_print_board(grid)
		output = ""
		size = grid.length
	    size.times do |position|
	      	output << (grid[position].nil? ? position.to_s : "#{grid[position]}")
	   		insert_spaces(position, size, output, grid)
	    end
	    puts "\n Your Board \n\n\n" + output
	  end

	def prompt
		puts "Where do you want to place your X?"
	end

	def user_input
		gets.chomp

	end

	def denied
		puts "Already occupied, try again"
	end

	def cats_game
		puts "CATS GAME!"
	end

	def computer_wins
		puts "Computer wins!  Again"
	end

	def player_wins
		puts "Human wins!  Impossible!"
	end

	def reject(position)
		puts "#{position} isnt no good"
	end
end
