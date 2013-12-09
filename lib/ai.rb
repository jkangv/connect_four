require_relative 'board'

class Player
  attr_reader :name, :piece

  def initialize(name, piece)
    @name = name
    @piece = piece
  end
end


class AI
  attr_reader :piece, :name
  attr_accessor :winning_move

  def initialize(board,piece,player)
    @name = "AI"
    @piece = piece
    @board = board
    @player = player
  end

  def ai_move(column)
    @board.move(column)
  end


  def winnable?
    winnable = false

    @winning_move = nil
    column = 1
    until column == 8
      if @board.win_move?(column)
        @winning_move = column
        winnable = true
      end
      break if winnable
      column += 1
    end
    winnable
  end

  def make_move
    if self.winnable?
      self.ai_move(@winning_move)
    else
      self.ai_move(rand(1..7))
    end
  end
end
