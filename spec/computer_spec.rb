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

	it 'knows the current player' do
		new_board.grid = [0,1,2,"X",4,5,6,7,8]
		new_board.current_player.should == COMPUTER
	end


	it "checks for human wins during recursion" do
		new_board.grid = ["X", 1, 2, "X", 4, 5, "X", 7, 8]
		new_computer.minimax_recurse(new_board,"X", 1).should == 1
	end

	it "checks for computer wins during recursion" do
		new_board.grid = [0, "O", 2, "X", "O", 5, "X", "O", 8]
		new_computer.minimax_recurse(new_board,"O", 1).should == -1
	end

	it "checks for ties during recursion" do
		new_board.grid = ["X","O","X","X","O","O","O","X","X"]
		new_computer.minimax_recurse(new_board, "O", 8).should == 0
	end

	# it 'returns sub-alpha values for a given board' do
	# 	new_board.grid = [0, 1, "O", 3, "O", "X", "X", "X", 8]
	# 	new_computer.minimax_recurse(new_board, HUMAN, 4).should == 1
	# end

	it 'returns sub-alpha values for a given board' do
		new_board.grid = [0, 1, 2 , 3, 4, 5, 6, 7, 8]
		new_computer.minimax_recurse(new_board, HUMAN, 0).should == 1
	end

	# end

	# describe '#computer_move' do
	# 	before(:each) do
	# 		Board.stub(:new).and_return(new_board)
	# 	end

	# end
end
