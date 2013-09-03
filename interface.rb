class Interface

	def print_board(board)
		puts "0 1 2"
		puts "3 4 5"
		puts "6 7 8"
		puts " "
		board.each_slice(3) {|row| p row.map{|cell| cell.class == Fixnum ? '-' : cell}}
	end

	def pretty_print_board(board)
		output = ""
	    9.times do |position|
	      output << " #{board[position]} "
	      case position % 3
	      when 0, 1 then output << "|"
	      when 2 then output << "\n-----------\n" unless position == 8
	      end
	    end
	    puts output
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

	def reject(position)
		puts "#{position} isnt no good"
	end
end
