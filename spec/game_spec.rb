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

	it 'determines when the game is over' do
		fun_game.stub(:new).and_return(new_board)
		new_board.stub(:tie?).and_return(true)
		fun_game.game_over.should be(true)
	end

	it "informs the player of bad input" do
		# new_interface.stub(:gets){"g\n"}
		# fun_game.validate_input("\z", new_board.grid)
		# fun_game.should_receive(:validate_input).with("d", new_board.grid)
		fun_game.should_receive(:puts).with("f isnt no good")
		fun_game.validate_input("f", new_board.grid)
	# 	new_interface.prompt
	end
end
