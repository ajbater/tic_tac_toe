require 'game'

describe Game do
  let(:board) { double :board }
  let(:player1) { double :player }
  subject(:game) { described_class.new(board) }

  it 'takes a board upon instantiation' do
    expect(game.board).to eq board
  end

  it 'has no players when a new game is created' do
    expect(game.player1).to eq nil
  end

  # it 'can take players' do
  #   game.add_player(player1)
  #   expect(game.player1).to eq player1
  # end
end
