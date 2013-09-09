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

end
