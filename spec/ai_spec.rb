require 'rspec'
require_relative '../lib/ai'
require_relative '../lib/board'
require_relative '../lib/player'

describe AI do
  class Board
    attr_accessor :board
  end
  let(:board) {Board.new}
  let(:player) {Player.new("Jihun", "O")}
  let(:ai) {AI.new(board,"X")}

  it 'should know when ai can win with one more move with horizontal four in a row' do 
    ai.opponent = player
    board.piece = "X"
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

  it 'should know when ai can win with one more move with horizontal four in a row' do 
    ai.opponent = player
    board.piece = "X"
    board.board = [
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", " X ", " X ", " X ", "   "],
      ["   ", "   ", " O ", " O ", " O ", " X ", "   "],
      ["   ", "   ", " X ", " O ", " X ", " O ", "   "],
      [" O ", " O ", " O ", " X ", " X ", " O ", "   "],
      [" X ", " X ", " O ", " O ", " O ", " X ", "   "]
    ]
    ai.winnable?.should eql(true)
  end

  it 'should know when ai can win with one more move with horizontal four in a row' do 
    ai.opponent = player
    board.piece = "X"
    board.board = [
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", " O ", " O ", "   "],
      ["   ", "   ", " O ", "   ", " X ", " X ", " X "],
      ["   ", "   ", " X ", " O ", " X ", " O ", " X "],
      [" O ", " O ", " O ", " X ", " X ", " O ", " X "],
      [" X ", " X ", " O ", " O ", " O ", " X ", " O "]
    ]
    ai.winnable?.should eql(true)
  end

  it 'should know when ai can win with one more move with horizontal four in a row' do 
    ai.opponent = player
    board.piece = "X"
    board.board = [
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", " X ", " X ", " X ", "   "],
      ["   ", "   ", "   ", " O ", " O ", " X ", "   "],
      ["   ", " X ", " X ", " O ", " X ", " O ", "   "],
      [" O ", " O ", " O ", " X ", " X ", " O ", "   "],
      [" X ", " X ", " O ", " O ", " O ", " X ", "   "]
    ]
    ai.winnable?.should eql(false)
  end

  it 'should know to win by making a horizontal four in a row' do 
    ai.opponent = player
    board.piece = "X"
    board.board = [
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      [" O ", " O ", " O ", "   ", "   ", "   ", "   "],
      [" X ", " X ", " X ", "   ", "   ", "   ", "   "]
    ]
    ai.make_move
    board.board.should eql([
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      [" O ", " O ", " O ", "   ", "   ", "   ", "   "],
      [" X ", " X ", " X ", " X ", "   ", "   ", "   "]
    ])
  end

  it 'should drop its piece in column 4 if board is empty' do 
    ai.opponent = player
    board.piece = "X"
    board.board = [
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "]
    ]
    ai.make_move
    board.board.should eql([
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", " X ", "   ", "   ", "   "]
    ])
  end

  it 'should drop its piece in column 4 if first player took column 4 as first move' do
    ai.opponent = player
    board.piece = "X"
    board.board = [
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", " O ", "   ", "   ", "   "]
    ]
    ai.make_move
    board.board.should eql([
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", " X ", "   ", "   ", "   "],
      ["   ", "   ", "   ", " O ", "   ", "   ", "   "]
    ])
  end

  it 'should drop its piece in column 4 if first player didnt take column 4 as first move' do
    ai.opponent = player
    board.piece = "X"
    board.board = [
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", " O ", "   ", "   ", "   ", "   ", "   "]
    ]
    ai.make_move
    board.board.should eql([
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", " O ", "   ", " X ", "   ", "   ", "   "]
    ])
  end
end
