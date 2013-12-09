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

  def initialize(board,player)
    @name = "AI"
    @piece = "X"
    @board = board
    @player = player
  end

  def ai_move(column)
    @board.piece = @piece
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

  def turn
    if self.winnable?
      self.ai_move(4)
    end
  end
end
board = Board.new
player = Player.new("Jihun", "O")
ai = AI.new(board,player)
