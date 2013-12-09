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
    # Horizontal winnable test
    # @board.board.each_index do |row|
    #   next if @board.board[row].all? {|piece| piece == "   "}
    #   possible_win_index = nil
    #   @winning_move = nil
    #   @board.board[row].each_index do |index|
    #     break if index > 4
    #     if @board.board[row][index..(index+2)].all? {|piece| piece == " X "}
    #       possible_win_index = index
    #       break
    #     else
    #       next
    #     end
    #   end
    #   next if possible_win_index == nil
    #   if possible_win_index == 0 || possible_win_index == 6
    #     if @board.move(4) == true
    #       winnable = true
    #       @winning_move = 4
    #     end
    #   elsif possible_win_index
    #     if @board.board[row+1] == nil
    #       if @board.move(possible_win_index) == true
    #         @winning_move = possible_win_index
    #       elsif @board.move(possible_win_index+3) == true
    #         @winning_move = possible_win_index+3
    #       end
    #     elsif @board.board[row+1][possible_win_index-1] != "   "
    #       winnable = true
    #       @winning_move = possible_win_index
    #     elsif @board.board[row+1][possible_win_index+3] != "   "
    #       winnable = true
    #       @winning_move = possible_win_index+3
    #     end
    #   end
    #   break if winnable
    # end

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
