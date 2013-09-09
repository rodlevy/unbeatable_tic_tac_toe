require 'board'

describe Board do
	let(:new_board) {Board.new(9)}
	let(:new_board_16){Board.new(16)}
	let(:new_interface) {Interface.new}
	HUMAN = "X"
	COMPUTER = "O"

	it "checks for player victories(3x3)" do
		new_board.grid = ["X", 1, 2, "X", 4, 5, "X", 7, 8]
		new_board.winner?("X").should eq true
	end

	it "checks for player victories(4x4)" do
		new_board.grid = ["X", 1, 2, 3, 4, "X", 6, 7, 8,9,"X",11,12,13,14,"X"]
		new_board.winner?("X").should eq true
	end

	it 'checks for a tie' do
		new_board.grid = ["X","O","X","X","O","O","O","X","X"]
		new_board.tie?.should == true
	end

	it 'checks for a tie(4x4)' do
		new_board_16.grid = ["X","O","X","O","O","O","X","O","X", "X","O","O","X","O","X","X"]
		new_board_16.tie?.should == true
	end

	it 'checks for a tie(4x4)' do
		new_board_16.grid = ["X","O","X","O","O","O","X","O","X", "O","O","O","X","X","X","X"]
		new_board_16.tie?.should == false
	end

	it "stores player positions" do
		new_board.store_position(1, HUMAN)
		new_board.grid.should == [0, "X",2,3,4,5,6,7,8]
	end

	it "checks to see if a spot is occupied" do
		grid = [0,1,2,3,4,5,6,7,8]
		new_board.occupied?(grid, 3).should eq false
	end

	it "lets players alternate" do
		new_board.take_turn(HUMAN).should == COMPUTER
	end

	it "makes initial possible board" do
		new_board.make_possible_boards([0,1,2,3,4,5,6,7,8], HUMAN, 0)
		new_board.possible_boards.should include([0,1,2,3,4,5,6,7,8])
	end

	it "makes board with first move" do
		new_board.make_possible_boards([0,1,2,3,4,5,6,7,8], HUMAN, 0)
		new_board.possible_boards.should include([HUMAN,1,2,3,4,5,6,7,8])
	end

	it "makes board with second move" do
		new_board.make_possible_boards([0,1,2,3,4,5,6,7,8], HUMAN, 0)
		new_board.possible_boards.should include([HUMAN,COMPUTER,2,3,4,5,6,7,8])
	end

	it 'makes the last board' do
		new_board.make_possible_boards([0,1,2,3,4,5,6,7,8], HUMAN, 0)
		new_board.possible_boards.should include([HUMAN,COMPUTER, HUMAN,COMPUTER,HUMAN,COMPUTER,HUMAN,COMPUTER,HUMAN])
	end

	it 'makes a second version of the last board' do
		new_board.make_possible_boards([0,1,2,3,4,5,6,7,8], HUMAN, 0)
		new_board.possible_boards.should include([HUMAN,COMPUTER, HUMAN,COMPUTER,HUMAN,COMPUTER,HUMAN,HUMAN,COMPUTER])
	end

	# it "makes several different boards" do
	# 	new_board.make_possible_boards([0,1,2,3,4,5,6,7,8], HUMAN, 0)
	# 	new_board.possible_boards.should include([HUMAN,COMPUTER,2,3,COMPUTER,5,HUMAN,7,8])
	# end

	# it 'starts out numbered 0 to 8' do
	# 	new_board.grid
	# 	expect(new_board.grid).to eq([0,1,2,3,4,5,6,7,8])
	# end

	# it 'returns true if opposite corners occupied by same player' do
	# 	new_board.grid = ["X",1,2,3,4,5,6,7,"X"]
	# 	expect{new_board.same_player_opposite_corners("X")}.to be_true
	# end

	# it 'returns true if left top corner is computer and bottom right is player' do
	# 	new_board.grid = ["O",1,2,3,"O", 5,6,7,"X"]
	# 	expect{new_board.left_top_corner_computer_bottom_rt_player}.to be_true
	# end

	# it 'checks the edge case of top center, left center and bottom rt corner are player occupied' do
	# 	new_board.grid = [0,"X",2,"X",4,5,6,7,"X"]
	# 	expect{new_board.edge_case}.to be_true
	# end


	it "checks for unoccupied spaces" do
		new_board.grid = [0, "X",2,3,4,5,6,7,8]
		new_board.unoccupied(1).should == false
	end



	it "tests possible combinations for computer's victory(3x3)" do
		new_board.grid = ["O", 1, 2, "O", 4, 5, "O", 7, 8]
		new_board.winner?("O").should eq true
	end

# 	it "tests possible combinations to block a player's imminent victory" do
# 		new_board.grid = ["X", 1, 2, "X", 4, 5, 6, 7, 8]
# 		new_board.check_participant_win("X")
# 		new_board.grid.should == ["X", 1, 2, "X", 4, 5, "O", 7, 8]
# 	end

# 	it 'fills in a random spot if there\'s no imminent win or block after 2 moves' do
# 		new_board.grid = ["X", 1,2,"O","O","X", "X",7,8]
# 		new_board.random_fill
# 		new_board.grid.count("O").should == 3
# 	end

end
