class Board
  attr_accessor :piece, :board
  # attr_reader :board

  def initialize
    @board = Array.new(6) {Array.new(7, "   ")}
  end
  
  def display
    board = ""
    @board.each do |row|
      row.each_index do |index|
        if index < 6
          board << row[index] + "|"
        else
          board << row[index]
        end
      end
      board << "\n---------------------------\n"
    end
    board
  end

  def move(column)
    @board.reverse_each do |row|
      if row[column-1] == "   "
        row[column-1] = " #{@piece} "
        break
      end
    end
    return "moved"
  end

  def win?
    win = false
    @board.each_index do |row|
      @board[row].each_index do |column|
        next if @board[row][column] == "   "
        next if row > 2 && column > 3
        
        if column < 4 # Horizontal four in a row test
          if @board[row][column] == @board[row][column+1] && @board[row][column+1] == @board[row][column+2] && @board[row][column+2] == @board[row][column+3]
            win = true
            break
          end
        end

        if row < 3 # Vertical four in a row test
          if @board[row][column] == @board[row+1][column] && @board[row+1][column] == @board[row+2][column] && @board[row+2][column] == @board[row+3][column]
            win = true
            break
          end
        end

        if row < 3 && column < 4 # Diagonal four in a row test: from northwest to southeast
          if @board[row][column] == @board[row+1][column+1] && @board[row+1][column+1] == @board[row+2][column+2] && @board[row+2][column+2] == @board[row+3][column+3]
            win = true
            break
          end
        end

        if row < 3 && column > 2 # Diagonal four in a row test: from northeast to southwest
          if @board[row][column] == @board[row+1][column-1] && @board[row+1][column-1] == @board[row+2][column-2] && @board[row+2][column-2] == @board[row+3][column-3]
            win = true
            break
          end
        end
      end
      break if win == true
    end
    win
  end

  def win_move?(column)
    win_move = false
    @board.reverse_each do |row|
      if row[column-1] == "   "
        row[column-1] = " #{@piece} "
        if self.win?
          win_move = true
        end
        row[column-1] = "   "
        break
      end
    end
    win_move
  end

  def column_full?(column_number)
    column = @board.map do |row|
      row[column_number-1]
    end
    !column.include? ("   ")
  end

  def empty_board?
    empty_board = false
    empty_board = true if @board.all? {|row| row.all? {|slot| slot == "   "}}
    empty_board
  end

end
