require 'game'

describe Game do
  let(:board) { double :board }
  let(:player1) { double :player }
  let(:player2) { double :player }
  subject(:game) { described_class.new(board) }

  it 'takes a board upon instantiation' do
    expect(game.board).to eq board
  end

  context 'has no players when a new game is created' do
    it 'has no player 1' do
      expect(game.player1).to eq nil
    end

    it 'has no player 2' do
      expect(game.player2).to eq nil
    end
  end

  context 'when adding players' do
    it 'can add player 1' do
      game.add_player(player1)
      expect(game.player1).to eq player1
    end

    it 'can add player 2' do
      game.add_player(player1)
      game.add_player(player2)
      expect(game.player2).to eq player2
    end

    it 'know when it has two players' do
      game.add_player(player1)
      game.add_player(player2)
      expect(game.two_players?).to eq true
    end

    it 'knows when it does not have two players' do
      game.add_player(player1)
      expect(game.two_players?).to eq false
    end

    it 'cannot add more than two players' do
      game.add_player(player1)
      game.add_player(player2)
      expect{ game.add_player('another_player') }.to raise_error('You already have two players - your game is ready to begin!')
    end
  end
  context 'starting the game' do
    it 'will not allow a turn to be taken when there are not two players' do
      expect { game.take_turn(:A1) }.to raise_error('You cannot begin the game until you have two players!')
    end

    it 'will allow a turn to be take when there are two players' do
      game.add_player(player1)
      game.add_player(player2)
      expect { game.take_turn(:A1) }.not_to raise_error('You cannot begin the game until you have two players!')
    end
  end

  context 'when playing a game' do
    before do
      game.add_player(player1)
      game.add_player(player2)
      allow(board).to receive(:claim_field)
    end

    it 'knows that player 1 goes first' do
      expect(game.turn).to eq player1
    end

    it 'can switch players so player two can take their turn' do
      game.switch_player
      expect(game.turn).to eq player2
    end

    it 'knows the who the current player is' do
      expect(game.current_player).to eq player1
    end

    # it 'can claim a the chosen field when a turn is taken' do
    #   game.take_turn(:A1)
    #   expect(board).to receive(:claim_field).with(:A1)
    # end
  end
end
