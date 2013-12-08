require_relative 'board'

class ConnectFour
  attr_reader :player_1, :player_2
  def initialize(player_1, player_2)
    @turn = 1
    @player_1 = player_1
    @player_2 = player_2
    @board = Board.new
  end

  def play_vs_human
    puts "Here's the board!"
    puts @board.display
    until @board.win? || @turn == 43
      if @turn % 2 == 1
        @board.piece = player_1.piece
        whose_turn = player_1
      else
        @board.piece = player_2.piece
        whose_turn = player_2
      end
      puts "Please choose a column (1~7) drop your piece, #{whose_turn.name} ( #{whose_turn.piece} ):"
      column = gets.chomp.to_i
      next if column > 7 || column < 1 || @board.column_full?(column)
      @board.move(column)
      puts @board.display
      @turn += 1
    end
    puts "winner: #{whose_turn.name}" if @board.win?
    puts "draw!" if @turn == 43
  end
end

class Player
  attr_reader :name, :piece

  def initialize(name, piece)
    @name = name
    @piece = piece
  end
end

puts "Hello, what is your name, player 1? You will get to go first."
player_1_name = gets.chomp
puts "Great, what is your name, player 2?"
player_2_name = gets.chomp
puts "Thank you, #{player_2_name}." 

player_1_piece = ""
until player_1_piece.upcase == "X" || player_1_piece.upcase == "O"
  puts "#{player_1_name}, which piece do you choose, X or O?"
  player_1_piece = gets.chomp.upcase
end

player_2_piece = player_1_piece == "X" ? "O" : "X"
player_1 = Player.new(player_1_name,player_1_piece)
player_2 = Player.new(player_2_name,player_2_piece)
puts
puts
ConnectFour.new(player_1,player_2).play_vs_human