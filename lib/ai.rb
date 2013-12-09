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

    # Horizontal winnable test
    @board.board.each_index do |row|
      next if @board.board[row].all? {|piece| piece == "   "}
      consecutive_pieces = []
      @board.board[row].each_cons(3) {|pieces| consecutive_pieces << pieces}
      winnable = true if consecutive_pieces.include?(Array.new(3, " X "))
      break if winnable == true
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

