require 'game'
require 'interface'
require 'board'
# puts $:
describe Game do
	let!(:new_interface) {Interface.new}
	let!(:new_board) {Board.new}
	let(:new_computer) {Computer.new}
	let(:fun_game) {Game.new(new_board, new_interface, new_computer)}

	it "can handle bad user input" do
		Interface.stub(:new).and_return(new_interface)
		fun_game.check("h", new_board.grid).should be_false
	end

	it "informs the player of bad input" do
		Interface.stub(:new).and_return(new_interface)
		new_interface.stub(:gets){"g\n"}
		fun_game.should_receive(:puts).with("f isnt no good").at_least(1).times
		new_interface.prompt
	end
end
