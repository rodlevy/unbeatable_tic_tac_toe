require 'game'
require 'interface'
require 'board'
# puts $:
describe Game do
	let!(:new_interface) {Interface.new}
	let!(:new_board) {Board.new(9)}
	let(:new_computer) {Computer.new}
	let(:fun_game) {Game.new(new_interface, new_computer)}

	it "can check that human's move is within the board" do
		fun_game.check_within_range("7", new_board.grid.length).should eq true
	end

	it "informs the player of bad input" do
		fun_game.should_receive(:puts).with("d isnt no good").at_least(1)
		new_interface.stub(:gets){"g\n"}
		fun_game.validate_input("d", new_board.grid)
	# 	Interface.stub(:new).and_return(new_interface)
	# 	new_interface.stub(:gets){"g\n"}
	# 	fun_game.should_receive(:puts).with("f isnt no good").at_least(1).times
	# 	new_interface.prompt
	end
end
