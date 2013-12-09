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
board = Board.new
player = Player.new("Jihun", "O")
ai = AI.new(board,player)

puts "Here's the board!"
puts board.display
turn = 1
until board.win? || turn == 43
  if turn % 2 == 1
    board.piece = player.piece
    whose_turn = player
    puts "Please choose a column (1~7) drop your piece, #{whose_turn.name} ( #{whose_turn.piece} ):"
    column = gets.chomp.to_i
    next if column > 7 || column < 1 || board.column_full?(column)
    board.move(column)
  else
    puts "AI made its move:"
    board.piece = ai.piece
    whose_turn = ai
    ai.make_move
  end
  puts board.display
  turn += 1
end
puts "winner: #{whose_turn.name}" if board.win?
puts "draw!" if turn == 43
