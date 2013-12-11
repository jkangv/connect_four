class AI
  attr_reader :piece
  attr_accessor :move, :name, :opponent

  def initialize(board,piece)
    @name = "AI"
    @piece = piece
    @board = board
    @move = nil
  end

  def slots_remaining(column)
    slots = 6
    @board.board.reverse_each do |row|
      slots -= 1 if row[column-1] != "   "
    end
    slots
  end

  def win_move
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
    @move
  end

  def block_move
    column = 1
    must_block = false
    @board.piece = @opponent.piece
    until column == 8
      if @board.win_move?(column)
        @move = column
        must_block = true
      end
      break if must_block
      column += 1
    end
    @board.piece = self.piece
    @move
  end

  def calculate_move
    @move
  end

  def initial_move
    if @board.empty_board?
      @move = 4
    elsif @board.board[5][3] == " #{@opponent.piece} " && @board.board[4].all? {|piece| piece == "   "} && @board.board[5].count(" #{opponent.piece} ") == 1
      @move = rand(3..5)
    elsif @board.board[5][3] == "   " && @board.board[4].all? {|piece| piece == "   "} && @board.board[5].count(" #{opponent.piece} ") == 1
      @move = 4
    end
    @move    
  end

  def make_move
    if self.initial_move
      @board.move(@move)
    elsif self.win_move
      @board.move(@move)
    elsif self.block_move
      @board.move(@move)
    elsif self.calculate_move
      @board.move(@move)
    else
      random = []
      (1..7).each {|number| random << number unless @board.column_full?(number)}
      @board.move(random.sample)
    end
    @move = nil
  end
end


