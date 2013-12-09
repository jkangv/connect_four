require 'rspec'
require_relative '../lib/board'

describe Board do
  class Board
    attr_accessor :board
  end
  let(:board) {Board.new}

  it 'should correctly drop a piece to the bottom of a column' do
    board.piece = "X"
    board.move(1)
    board.board.should eql([
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      [" X ", "   ", "   ", "   ", "   ", "   ", "   "]
    ])
  end

  it 'should correctly drop on the top of the highest piece of a column' do 
    board.piece = "X" 
    board.move(1)
    board.piece = "O"
    board.move(1)
    board.board.should eql([
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      [" O ", "   ", "   ", "   ", "   ", "   ", "   "],
      [" X ", "   ", "   ", "   ", "   ", "   ", "   "]
    ])
  end

  it 'should correctly drop on the top of the highest piece of a column' do 
    board.piece = "X"
    board.move(2)
    board.piece = "O"
    board.move(2)
    board.piece = "X"
    board.move(2)
    board.piece = "O"
    board.move(2)
    board.board.should eql([
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
      ["   ", " O ", "   ", "   ", "   ", "   ", "   "],
      ["   ", " X ", "   ", "   ", "   ", "   ", "   "],
      ["   ", " O ", "   ", "   ", "   ", "   ", "   "],
      ["   ", " X ", "   ", "   ", "   ", "   ", "   "]
    ])
  end

  it 'should know when there is a vertical four in a row, there is a winner' do
    board.board = [
      ["   ", " X ", "   ", "   ", "   ", "   ", "   "],
      ["   ", " X ", "   ", "   ", "   ", "   ", "   "],
      ["   ", " X ", "   ", "   ", "   ", "   ", "   "],
      ["   ", " X ", "   ", "   ", "   ", "   ", "   "],
      ["   ", " O ", "   ", "   ", "   ", "   ", "   "],
      ["   ", " O ", " O ", " O ", "   ", " O ", "   "]
    ]
    board.win?.should eql(true)
  end

  it 'should know when there is a horizontal four in a row, there is a winner' do
    board.board = [
      ["   ", " X ", "   ", "   ", "   ", "   ", "   "],
      ["   ", " X ", "   ", "   ", "   ", "   ", "   "],
      ["   ", " X ", "   ", "   ", "   ", "   ", "   "],
      ["   ", " O ", "   ", "   ", "   ", "   ", "   "],
      ["   ", " O ", "   ", "   ", "   ", "   ", "   "],
      ["   ", " X ", " O ", " O ", " O ", " O ", "   "]
    ]
    board.win?.should eql(true)
  end

    it 'should know when there is a diagoanl: \ four in a row , there is a winner' do
    board.board = [
      ["   ", " X ", "   ", "   ", "   ", "   ", "   "],
      ["   ", " X ", " X ", "   ", "   ", "   ", "   "],
      ["   ", " X ", " O ", " X ", " O ", "   ", "   "],
      ["   ", " O ", " O ", " X ", " X ", "   ", "   "],
      ["   ", " O ", " X ", " O ", " O ", "   ", "   "],
      ["   ", " X ", " O ", " O ", " X ", " O ", "   "]
    ]
    board.win?.should eql(true)
  end

  it 'should know when there is a diagonal / four in a row, there is a winner' do
    board.board = [
      ["   ", " X ", "   ", "   ", "   ", "   ", "   "],
      ["   ", " X ", "   ", "   ", "   ", "   ", "   "],
      ["   ", " X ", "   ", "   ", "   ", "   ", " O "],
      ["   ", " O ", "   ", "   ", " X ", " O ", " X "],
      ["   ", " O ", "   ", "   ", " O ", " X ", " X "],
      ["   ", " X ", " X ", " O ", " O ", " O ", " O "]
    ]
    board.win?.should eql(true)
  end
end
