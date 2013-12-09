require 'rspec'
require_relative '../lib/ai'
require_relative '../lib/board'

describe AI do
  class Board
    attr_accessor :board
  end
  let(:board) {Board.new}
  let(:player) {Player.new("Jihun", "O")}
  let(:ai) {AI.new(board,player)}

  it 'should know when there are three horizontal pieces in a row the ai could win' do 
    board.board = [
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      [" O ", " O ", " O ", "   ", "   ", "   ", "   "],
      [" X ", " X ", " X ", "   ", "   ", "   ", "   "]
    ]
    ai.winnable?.should eql(true)
  end

  it 'should know to win by making a horizontal four in a row' do 
    board.board = [
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      [" O ", " O ", " O ", "   ", "   ", "   ", "   "],
      [" X ", " X ", " X ", "   ", "   ", "   ", "   "]
    ]
    ai.turn
    board.board.should eql([
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      [" O ", " O ", " O ", "   ", "   ", "   ", "   "],
      [" X ", " X ", " X ", " X ", "   ", "   ", "   "]
    ])
  end
end
