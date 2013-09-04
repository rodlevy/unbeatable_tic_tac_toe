require 'board'

describe Board do
	let(:new_board) {Board.new(9)}
	let(:new_interface) {Interface.new}

	it "checks for player victories" do
		new_board.grid = ["X", 1, 2, "X", 4, 5, "X", 7, 8]
		new_board.winner?("X").should eq true
	end

	it "stores player positions" do
		new_board.store_position(1, "player")
		new_board.grid.should == [0, "X",2,3,4,5,6,7,8]
	end

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


	# it "checks for unoccupied spaces" do
	# 	new_board.grid = [0, "X",2,3,4,5,6,7,8]
	# 	new_board.unoccupied(1).should == false
	# end



# 	it "tests possible combinations for computer's victory" do
# 		new_board.grid = ["O", 1, 2, "O", 4, 5, 6, 7, 8]
# 		new_board.check_participant_win("O")
# 		new_board.grid.should == ["O", 1, 2, "O", 4, 5, "O", 7, 8]
# 	end

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
