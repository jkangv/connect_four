require_relative 'board'
require_relative 'ai'
require_relative 'player'

class ConnectFour
  attr_reader :player_1, :player_2
  attr_writer :turn, :final_turn

  def initialize(board, player_1, player_2)
    @turn = 1
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    @final_turn = 43
  end

  def play_vs_human
    puts "Here's the board!"
    puts @board.display
    until @board.win? || @turn == @final_turn
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
    puts "winner: #{whose_turn.name} ( #{whose_turn.piece} )" if @board.win?
    puts "draw!" if @turn == @final_turn
  end

  def play_vs_ai
    puts "Here's the board!"
    puts @board.display
    until @board.win? || @turn == @final_turn
      if @turn % 2 == 1
        @board.piece = player_1.piece
        whose_turn = player_1
        puts "Please choose a column (1~7) drop your piece, #{whose_turn.name} ( #{whose_turn.piece} ):"
        column = gets.chomp.to_i
        next if column > 7 || column < 1 || @board.column_full?(column)
        @board.move(column)
      else
        @board.piece = player_2.piece
        whose_turn = player_2
        puts "AI ( #{whose_turn.piece} ) made its move:"
        player_2.make_move
      end
      puts @board.display
      @turn += 1
    end
    puts "winner: #{whose_turn.name} ( #{whose_turn.piece} )" if @board.win?
    puts "draw!" if @turn == @final_turn
  end

  def ai_vs_ai
    until @board.win? || @turn == @final_turn
      if @turn % 2 == 1
        @board.piece = player_1.piece
        whose_turn = player_1
        puts "AI 1 ( #{whose_turn.piece} ) made its move:"
        player_1.make_move
      else
        @board.piece = player_2.piece
        whose_turn = player_2
        puts "AI 2 ( #{whose_turn.piece} ) made its move:"
        player_2.make_move
      end
    puts @board.display
    @turn += 1 
    end
    puts "winner: #{whose_turn.name} ( #{whose_turn.piece} )" if @board.win?
    puts "draw!" if @turn == @final_turn
  end
end

puts "Welcome to Connect Four Mini Game!"
board = Board.new
puts "Would you like to play Human vs Human (1) or Human vs AI (2) or watch AI vs AI (3)?"
puts "Please choose 1, 2, 3. If you choose anything else, program will end"
answer = gets.chomp.to_i
if answer == 1
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
  game = ConnectFour.new(board,player_1,player_2)
  game.play_vs_human
elsif answer == 2
  puts "Hello, what is your name, player?"
  player_name = gets.chomp
  player_piece = ""
  until player_piece.upcase == "X" || player_piece.upcase == "O"
    puts "#{player_name}, which piece do you choose, X or O?"
    player_piece = gets.chomp.upcase
  end
  ai_piece = player_piece == "X" ? "O" : "X"
  player = Player.new(player_name, player_piece)
  ai = AI.new(board,ai_piece)
  ai.opponent = player
  game = ConnectFour.new(board,player,ai)
  answer_2 = ""
  until answer_2 == "yes" or answer_2 == "no"
    puts "Do you want to go first? (type yes/no)"
    answer_2 = gets.chomp.downcase
  end
  if answer_2 == "yes"
    game.play_vs_ai
  elsif answer_2 == "no"
    game.turn = 0
    game.final_turn = 42
    game.play_vs_ai
  end
elsif answer == 3
  ai_1 = AI.new(board, "X")
  ai_2 = AI.new(board, "O")
  ai_1.name = "AI 1"
  ai_2.name = "AI 2"
  ai_1.opponent = ai_2
  ai_2.opponent = ai_1
  game = ConnectFour.new(board,ai_1,ai_2)
  game.ai_vs_ai 
end
