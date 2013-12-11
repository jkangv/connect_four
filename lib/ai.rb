class AI
  attr_reader :piece
  attr_accessor :move, :name, :opponent

  def initialize(board,piece)
    @name = "AI"
    @piece = piece
    @board = board
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
    must_block
  end

  def calculate_move

  end

  def initial_moves?
    initial_moves = false
    if @board.empty_board?
      @move = 4
      initial_moves = true
    elsif @board.board[5][4] == " #{@opponent.piece} " && @board.board[4].all? {|piece| piece == "   "} && @board.board[5].count(" #{opponent.piece} ") == 1
      @move = 4
      initial_moves = true
    elsif @board.board[5][4] == "   " && @board.board[4].all? {|piece| piece == "   "} && @board.board[5].count(" #{opponent.piece} ") == 1
      @move = 4
      initial_moves = true
    end
    initial_moves
  end

  def make_move
    if self.initial_moves?
      @board.move(@move)
    elsif self.winnable?
      @board.move(@move)
    elsif self.must_block?
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


