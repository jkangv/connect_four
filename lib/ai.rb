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
      possible_win_index = nil
      @board.board[row].each_index do |index|
        if @board.board[row][index..(index+2)].all? {|piece| piece == " X "}
          possible_win_index = index
        else
          next
        end
      end
      next if possible_win_index == nil
      puts possible_win_index
      puts row
      if possible_win_index == 0 || possible_win_index == 6
        if @board.move(4) == true
          winnable = true
        end
      else
        if @board.board[row+1] == nil
          winnable = true if @board.move(possible_win_index) == true || @board.move(possible_win_index+3) == true
        elsif @board.board[row+1][possible_win_index-1] != "   "
          winnable = true
        elsif @board.board[row+1][possible_win_index+3] != "   "
          winnable = true
        end
      end
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
