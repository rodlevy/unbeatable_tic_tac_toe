class Interface

	def grid_size
		puts "What size board do you want to play (9, 16)"
		size = gets.chomp
		if size == "9" || size == "16"
			return size.to_i
		else
			puts "Please enter 9 or 16"
			grid_size
		end

	end

	def pretty_print_board(grid)
		output = ""
		size = grid.length
		axis_length = Math.sqrt(size).to_i
	    size.times do |position|
	      output << " #{grid[position]} "
	      if position % axis_length == (axis_length - 1)
	      	output << "\n" unless position == (size - 1)
	      else
	      	if position < 10 || grid[position].class != Fixnum
	      		output << " "
	      	else
	      		output << ""
	      	end
	      end

	    end
	    puts "\n Your Board \n\n\n" + output
	  end

	def prompt
		puts "Where do you want to place your X?"
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
