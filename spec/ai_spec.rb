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

  it 'should know when ai can win with one more move with horizontal four in a row' do 
    board.board = [
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      [" O ", " O ", " O ", "   ", "   ", "   ", "   "],
      [" X ", " X ", " X ", "   ", "   ", "   ", "   "]
    ]
    board.piece = "X"
    ai.winnable?.should eql(true)
  end

  it 'should know when ai can win with one more move with horizontal four in a row' do 
    board.board = [
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", " X ", " X ", " X ", "   "],
      ["   ", "   ", " O ", " O ", " O ", " X ", "   "],
      ["   ", "   ", " X ", " O ", " X ", " O ", "   "],
      [" O ", " O ", " O ", " X ", " X ", " O ", "   "],
      [" X ", " X ", " O ", " O ", " O ", " X ", "   "]
    ]
    board.piece = "X"
    ai.winnable?.should eql(true)
  end

  it 'should know when ai can win with one more move with horizontal four in a row' do 
    board.board = [
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", " O ", " O ", "   "],
      ["   ", "   ", " O ", "   ", " X ", " X ", " X "],
      ["   ", "   ", " X ", " O ", " X ", " O ", " X "],
      [" O ", " O ", " O ", " X ", " X ", " O ", " X "],
      [" X ", " X ", " O ", " O ", " O ", " X ", " O "]
    ]
    board.piece = "X"
    ai.winnable?.should eql(true)
  end

  it 'should know when ai can win with one more move with horizontal four in a row' do 
    board.board = [
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", " X ", " X ", " X ", "   "],
      ["   ", "   ", "   ", " O ", " O ", " X ", "   "],
      ["   ", " X ", " X ", " O ", " X ", " O ", "   "],
      [" O ", " O ", " O ", " X ", " X ", " O ", "   "],
      [" X ", " X ", " O ", " O ", " O ", " X ", "   "]
    ]
    board.piece = "X"
    ai.winnable?.should eql(false)
  end

  # it 'should know to win by making a horizontal four in a row' do 
  #   board.board = [
  #     ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
  #     ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
  #     ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
  #     ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
  #     [" O ", " O ", " O ", "   ", "   ", "   ", "   "],
  #     [" X ", " X ", " X ", "   ", "   ", "   ", "   "]
  #   ]
  #   ai.turn
  #   board.board.should eql([
  #     ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
  #     ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
  #     ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
  #     ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
  #     [" O ", " O ", " O ", "   ", "   ", "   ", "   "],
  #     [" X ", " X ", " X ", " X ", "   ", "   ", "   "]
  #   ])
  # end
end
