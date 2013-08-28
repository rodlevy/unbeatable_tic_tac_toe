require_relative 'spec_helper'

describe Board do
	# before(:each){ game = Board.new }

	let(:new_board) {Board.new}

	it "creates a new Board object" do
		new_board.should be_an_instance_of Board
	end

	it 'starts out numbered 0 to 8' do
		new_board.grid.should == [0,1,2,3,4,5,6,7,8]
	end

	it "stores player positions" do
		new_board.store_position(1, "player")
		new_board.grid.should == [0, "X",2,3,4,5,6,7,8]
	end

	it "checks for unoccupied spaces" do
		new_board.grid = [0, "X",2,3,4,5,6,7,8]
		new_board.unoccupied(1).should == false
	end

	it "checks for player victories" do
		new_board.grid = ["X", 1, 2, "X", 4, 5, "X", 7, 8]
		new_board.victory_check("X").should eq true
	end


	it "tests possible combinations for computer's victory" do
		new_board.grid = ["O", 1, 2, "O", 4, 5, 6, 7, 8]
		new_board.check_computer_win
		new_board.grid.should == ["O", 1, 2, "O", 4, 5, "O", 7, 8]
	end

	it "tests possible combinations to block a player's imminent victory" do
		new_board.grid = ["X", 1, 2, "X", 4, 5, 6, 7, 8]
		new_board.check_player_win
		new_board.grid.should == ["X", 1, 2, "X", 4, 5, "O", 7, 8]
	end

end

describe Game do
	let(:fun_game) {Game.new}

	it "can handle bad user input" do
		fun_game.stub(:gets){"f\n"}
		fun_game.should_receive(:puts).with("f isnt no good").at_least(1).times
		fun_game.prompt
	end

	describe '.first_move' do
		let!(:new_board) {Board.new}

		it "should take the center if unoccupied" do
			Board.stub(:new).and_return(new_board)
			new_board.store_position(0, "player")
			fun_game.first_move
			new_board.grid.should == ["X", 1, 2, 3 , "O", 5, 6, 7, 8]
		end
	end

	describe '.computer_move' do
		let!(:new_board) {Board.new}
		before(:each) do
			Board.stub(:new).and_return(new_board)
		end

		it "should take a winning move if it\'s there" do
			new_board.grid = ["O",1,2,"X","O","X","X",7,8]
			fun_game.computer_move
			new_board.grid.should ==  ["O",1,2,"X","O","X","X",7,"O"]
		end


		it "should block X\'s winning move" do
			new_board.grid = ["X",1,2,"O","O","X",6,7,"X"]
			fun_game.computer_move
			new_board.grid.should ==  ["X",1,"O","O","O","X",6,7,"X"]
		end
	end
end
