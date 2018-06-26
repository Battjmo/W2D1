require_relative "modules"

class Piece
  attr_reader :pos, :type, :current_pos

  def initialize(type, pos, board)
    @type = type
    @start_pos = pos
    @board = board
  end

#CLASS END
end

class Rook < Piece
  include SlidingPiece

  attr_reader :possible_moves

  def initialize(name, pos, board)
    super
    @possible_moves = []
  end

  def get_possible_moves
    @possible_moves = moves(move_dir)
  end

  def move_dir
    return "Orthagonal"
  end

#END OF CLASS
end

class Queen < Piece
  include SlidingPiece

  attr_reader :possible_moves

  def initialize(name, pos, board)
    super
    @possible_moves = []
  end

  def get_possible_moves
    @possible_moves = moves(move_dir)
  end

  def move_dir
    return "Queen"
  end

#END OF CLASS
end


class Bishop < Piece
  include SlidingPiece

  attr_reader :possible_moves

  def initialize(name, pos, board)
    super
    @possible_moves = []
  end

  def get_possible_moves
    @possible_moves = moves(move_dir)
  end

  def move_dir
    return "Diagonal"
  end

#END OF CLASS
end






if $PROGRAM_NAME == __FILE__
  b = Queen.new("Mark", [4,4], "board")
  b.get_possible_moves
  p b.possible_moves
end
