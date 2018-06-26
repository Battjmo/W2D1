require_relative "piece"
require_relative "cursor"
require_relative "display"

class Board
  attr_reader :grid
  
  def initialize
    @grid = Array.new(8) {Array.new(8)}
    populate
  end

  def populate
    pieces = [0, 1, 6, 7]
    pieces.each do |row| # 0
      @grid[row].map!{|el| el = Piece.new}
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
