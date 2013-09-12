require 'game'
require 'interface'
require 'board'


describe Interface do

	let!(:new_interface) {Interface.new}
	let!(:new_board) {Board.new(9)}
	let(:new_computer) {Computer.new}
	let(:fun_game) {Game.new(new_interface, new_computer)}

	# it "informs the player of bad input" do
	# 		Interface.stub(:new).and_return(new_interface)
	# 		new_interface.stub(:gets){"g\n"}
	# 		fun_game.should_receive(:puts).with("f isnt no good").at_least(1).times
	# 		new_interface.prompt
	# 	end

	# it 'prints a board that corresponds to the grid size' do

	# end
	it 'gets the initial input from human' do
		new_interface.stub(:gets){"9\n"}
		new_interface.opening_prompt.should == "9"
	end

	it 'determines the grid length of the board' do
		new_interface.stub(:gets){"9\n"}
		new_interface.grid_size.should == 9
	end

	it 'prints out a pretty board' do
		new_interface.should_receive(:puts).with("\n Your Board \n\n\n0   1   2\n3   4   5\n6   7   8")
		new_interface.pretty_print_board(new_board.grid)
	end

end
