require_relative "piece"
require_relative "cursor"
require_relative "display"
require_relative "piece"

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) {Array.new(8)}
    # populate
  end

  def populate(board)
    @grid.each do |row|
      row.each do |col|
        col = NullPiece.instance
      end
    end

    8.times do |col|
      @grid[1][col] = Pawn.new(:black, [1, col], board)
      @grid[6][col] = Pawn.new(:white, [1, col], board)
    end

      @grid[0][0] = Rook.new(:black, [0,0], board)
      @grid[0][7] = Rook.new(:black, [0,7], board)
      @grid[7][0] = Rook.new(:white, [7,0], board)
      @grid[7][7] = Rook.new(:white, [7,7], board)

      @grid[0][1] = Knight.new(:black, [0,1], board)
      @grid[0][6] = Knight.new(:black, [0,6], board)
      @grid[7][1] = Knight.new(:white, [7,1], board)
      @grid[7][6] = Knight.new(:white, [7,6], board)

      @grid[0][2] = Bishop.new(:black, [0,2], board)
      @grid[0][5] = Bishop.new(:black, [0,5], board)
      @grid[7][2] = Bishop.new(:white, [7,2], board)
      @grid[7][5] = Bishop.new(:white, [7,5], board)

      @grid[7][6] = King.new(:white, [7,6], board)

      @grid[7][2] = Queen.new(:white, [0,2], board)

      @grid[0][6] = King.new(:black, [7,6], board)

      @grid[0][2] = Queen.new(:black, [0,2], board)

    starting_rows = [0, 7]
    pieces.each do |row| # 0
      @grid[row].map!{|el| el = Knight.new("Knight", [0,0], )}
    end
  end

  def move_piece(start_pos, end_pos)
    start_row, start_col = start_pos
    end_row, end_col = end_pos
    [start_row, start_col, end_row, end_col].each do |n|
      raise "Invalid position" unless n.between?(0,7)
    end
    if self[start_pos] == nil
      raise "No piece at this position."
    else
      self[end_pos] = self[start_pos]
      self[start_pos] = nil
    end

    #RAISE ERROR IF NOTHING IN STARTING POSITION
    #RAISE ERROR IF END POS IS AN INVALID MOVE
  end


  #HELPERS

  def valid_pos?(pos)
    raise "Invalid position" unless between?(0,7)
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, piece)
    row, col = pos
    @grid[row][col] = piece
  end







#END OF CLASS
end
