require_relative 'all_classes'

class AI
  attr_reader :piece, :name
  attr_accessor :move

  def initialize(board,piece,player)
    @name = "AI"
    @piece = piece
    @board = board
    @player = player
    @move = nil
  end

  def winnable?
    winnable = false
    column = 1
    until column == 8
      if @board.win_move?(column)
        @move = column
        winnable = true
      end
      break if winnable
      column += 1
    end
    winnable
  end

  def must_block?
    must_block = false
    column = 1
    @board.piece = @player.piece
    until column == 8
      if @board.win_move?(column)
        @move = column
        must_block = true
      end
      break if must_block
      column += 1
    end
    @board.piece = self.piece
    must_block
  end

  def make_move
    if self.winnable?
      @board.move(@move)
    elsif self.must_block?
      @board.move(@move)
    else
      @board.move(rand(1..7))
    end
  end
end


