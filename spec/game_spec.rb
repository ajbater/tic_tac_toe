require 'game'

describe Game do
  let(:board) { double :board }
  let(:player1) { double :player }
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
end
