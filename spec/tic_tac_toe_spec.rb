require_relative 'spec_helper'

describe ".board" do
	# before(:each){ game = Board.new }

	let(:game) {Board.new}

	it "creates a new Board object" do
		game.should be_an_instance_of Board
	end

	it 'starts out numbered 0 to 8' do
		game.board.should == [0,1,2,3,4,5,6,7,8]
	end

	it "stores player positions" do
		game.store_position(1, "player")
		game.board.should == [0, "X",2,3,4,5,6,7,8]
	end

	it "checks for unoccupied spaces" do
		game.board = [0, "X",2,3,4,5,6,7,8]
		game.unoccupied(1).should == false
	end

	it "checks for player victories" do
		game.board = ["X", 1, 2, "X", 4, 5, "X", 7, 8]
		game.victory_check("X").should eq true
	end


	it "tests possible combinations for computer's victory" do
		game.board = ["Y", 1, 2, "Y", 4, 5, 6, 7, 8]
		game.check_computer_win
		game.board.should == ["Y", 1, 2, "Y", 4, 5, "Y", 7, 8]
	end

	it "tests possible combinations to block a player's imminent victory" do
		game.board = ["X", 1, 2, "X", 4, 5, 6, 7, 8]
		game.check_player_win
		game.board.should == ["X", 1, 2, "X", 4, 5, "Y", 7, 8]
	end

end

describe Game do
	it "prints out the board" do

	end


end
