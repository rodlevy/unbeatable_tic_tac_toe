require_relative 'spec_helper'

describe Board do
	let(:new_board) {Board.new}

	it "creates a new Board object" do
		new_board.should be_an_instance_of Board
	end

	it 'starts out numbered 0 to 8' do
		new_board.grid.should == [0,1,2,3,4,5,6,7,8]
	end

	it 'returns true if opposite corners occupied by same player' do
		new_board.grid = ["X",1,2,3,4,5,6,7,"X"]
		new_board.same_player_opposite_corners("X").should be_true
	end

	it 'returns true if left top corner is computer and bottom right is player' do
		new_board.grid = ["O",1,2,3,"O", 5,6,7,"X"]
		new_board.left_top_corner_computer_bottom_rt_player.should be_true
	end

	it 'checks the edge case of top center, left center and bottom rt corner are player occupied' do
		new_board.grid = [0,"X",2,"X",4,5,6,7,"X"]
		new_board.edge_case.should be_true
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
		new_board.check_participant_win("O")
		new_board.grid.should == ["O", 1, 2, "O", 4, 5, "O", 7, 8]
	end

	it "tests possible combinations to block a player's imminent victory" do
		new_board.grid = ["X", 1, 2, "X", 4, 5, 6, 7, 8]
		new_board.check_participant_win("X")
		new_board.grid.should == ["X", 1, 2, "X", 4, 5, "O", 7, 8]
	end

	it 'fills in a random spot if there\'s no imminent win or block after 2 moves' do
		new_board.grid = ["X", 1,2,"O","O","X", "X",7,8]
		new_board.random_fill
		new_board.grid.count("O").should == 3
	end

end

describe Game do
	let(:fun_game) {Game.new}

	it "can handle bad user input" do
		fun_game.stub(:gets){"f\n"}
		fun_game.should_receive(:puts).with("f isnt no good").at_least(1).times
		fun_game.prompt
	end

	describe '#first_move' do
		let!(:new_board) {Board.new}
		before(:each) do
			Board.stub(:new).and_return(new_board)
		end

		it "should take the center if unoccupied" do
			new_board.store_position(0, "player")
			fun_game.first_move
			new_board.grid.should == ["X", 1, 2, 3 , "O", 5, 6, 7, 8]
		end

		it "should take the upper left corner if center occupied" do
			new_board.store_position(4, "player")
			fun_game.first_move
			new_board.grid.should == ["O", 1, 2, 3 , "X", 5, 6, 7, 8]
		end


	end

	describe '#computer_move' do
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

		it "should take the left center edge if corners are taken by Player" do
			new_board.grid = ["X",1,2,3,"O",5,6,7,"X"]
			fun_game.computer_move
			new_board.grid.should ==  ["X",1,2,"O","O",5,6,7,"X"]
		end

	end
end
