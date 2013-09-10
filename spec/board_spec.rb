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

	it 'stores simulated moves' do
		new_board.grid = [0, "X",2,3,4,5,6,7,8]
		board_copy = new_board.dup
		board_copy.simulate_move(board_copy, 3, "O").grid.should == [0, "X",2,"O",4,5,6,7,8]
	end


	it 'makes a list of possible moves' do
		grid = [0, "X",2,3,4,5,6,7,8]
		new_board.get_move_list(grid).should == [0,2,3,4,5,6,7,8]
	end

	# it "makes initial possible board" do
	# 	new_board.make_possible_boards([0,1,2,3,4,5,6,7,8], HUMAN, 0)
	# 	new_board.possible_boards.should include([0,1,2,3,4,5,6,7,8])
	# end
	# it "makes board with first move" do
	# 	new_board.make_possible_boards([0,1,2,3,4,5,6,7,8], HUMAN, 0)
	# 	new_board.possible_boards.should include([HUMAN,1,2,3,4,5,6,7,8])
	# end

	# it "makes board with second move" do
	# 	new_board.make_possible_boards([0,1,2,3,4,5,6,7,8], HUMAN, 0)
	# 	new_board.possible_boards.should include([HUMAN,COMPUTER,2,3,4,5,6,7,8])
	# end

	# it 'makes the last board' do
	# 	new_board.make_possible_boards([0,1,2,3,4,5,6,7,8], HUMAN, 0)
	# 	new_board.possible_boards.should include([HUMAN,COMPUTER, HUMAN,COMPUTER,HUMAN,COMPUTER,HUMAN,COMPUTER,HUMAN])
	# end

	# it 'makes a second version of the last board' do
	# 	new_board.make_possible_boards([0,1,2,3,4,5,6,7,8], HUMAN, 0)
	# 	new_board.possible_boards.should include([HUMAN,COMPUTER, HUMAN,COMPUTER,HUMAN,COMPUTER,HUMAN,HUMAN,COMPUTER])
	# end

	it "checks for unoccupied spaces" do
		new_board.grid = [0, "X",2,3,4,5,6,7,8]
		new_board.unoccupied(1).should == false
	end

	it "tests possible combinations for computer's victory(3x3)" do
		new_board.grid = ["O", 1, 2, "O", 4, 5, "O", 7, 8]
		new_board.winner?("O").should eq true
	end

end
