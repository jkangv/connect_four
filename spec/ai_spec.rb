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
    ai.win_move.should eql(4)
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
    ai.win_move.should eql(3)
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
    ai.win_move.should eql(4)
  end

  it 'should know when ai can\'t win with one more move with horizontal four in a row' do 
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
    ai.win_move.should eql(nil)
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

  it 'should know how many empty slots are left in a column' do 
    ai.opponent = player
    board.piece = "X"
    board.board = [
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", " X ", "   ", "   ", "   ", "   ", "   "],
      ["   ", " X ", "   ", "   ", "   ", "   ", "   "],
      ["   ", " O ", "   ", "   ", "   ", "   ", "   "]
    ]
    ai.slots_remaining(2).should eql(3)
  end

   it 'should know how many empty slots are left in a column' do 
    ai.opponent = player
    board.piece = "X"
    board.board = [
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", " X ", "   ", "   ", "   "],
      ["   ", " X ", "   ", " X ", "   ", "   ", "   "],
      ["   ", " X ", "   ", " O ", "   ", "   ", "   "],
      ["   ", " O ", "   ", " O ", "   ", "   ", "   "]
    ]
    ai.slots_remaining(4).should eql(2)
  end
end
