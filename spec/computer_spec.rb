require 'computer'
require 'board'

describe Computer do
	let!(:new_interface) {Interface.new}
	let!(:new_board) {Board.new(9)}
	let(:new_computer) {Computer.new}
	let(:fun_game) {Game.new(new_interface, new_computer)}

	it 'should fill a random spot, unoccupied, spot on the board' do
		new_board.grid = [0,1,2,"X",4,5,6,7,8]
		new_computer.random_fill(new_board)
		new_board.grid.should_not == [0,1,2,"X",4,5,6,7,8]
	end

	# describe '#first_move' do
	# 	before(:each) do
	# 		Board.stub(:new).and_return(new_board)
	# 	end

	# 	it "should take the center if unoccupied" do
	# 		new_board.store_position(0, "player")
	# 		new_computer.first_move(new_board)
	# 		new_board.grid.should == ["X", 1, 2, 3 , "O", 5, 6, 7, 8]
	# 	end

	# 	it "should take the upper left corner if center occupied" do
	# 		new_board.store_position(4, "player")
	# 		new_computer.first_move(new_board)
	# 		new_board.grid.should == ["O", 1, 2, 3 , "X", 5, 6, 7, 8]
	# 	end


	# end

	# describe '#computer_move' do
	# 	before(:each) do
	# 		Board.stub(:new).and_return(new_board)
	# 	end

	# 	it "should take a winning move if it\'s there" do
	# 		new_board.grid = ["O",1,2,"X","O","X","X",7,8]
	# 		new_computer.computer_move(new_board)
	# 		new_board.grid.should ==  ["O",1,2,"X","O","X","X",7,"O"]
	# 	end

	# 	it "should block X\'s winning move" do
	# 		new_board.grid = ["X",1,2,"O","O","X",6,7,"X"]
	# 		new_computer.computer_move(new_board)
	# 		new_board.grid.should ==  ["X",1,"O","O","O","X",6,7,"X"]
	# 	end

	# 	it "should take the left center edge if corners are taken by Player" do
	# 		new_board.grid = ["X",1,2,3,"O",5,6,7,"X"]
	# 		new_computer.computer_move(new_board)
	# 		new_board.grid.should ==  ["X",1,2,"O","O",5,6,7,"X"]
	# 	end

	# end
end
