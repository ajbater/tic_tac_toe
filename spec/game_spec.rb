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
  end
end
