require_relative "modules"
require_relative "board"
require "singleton"

class Piece
  attr_reader :pos, :type, :current_pos

  def initialize(color, pos, board)
    @color = color
    @start_pos = pos
    @board = board
  end

#CLASS END
end

class Rook < Piece
  include SlidingPiece

  attr_reader :possible_moves

  def initialize(color, pos, board)
    super
  end

  def get_possible_moves
    moves(move_dir)
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
   = []
  end

  def get_possible_moves
   = moves(move_dir)
  end

  def move_dir
    return "Queen"
  end

#END OF CLASS
end


class Bishop < Piece
  include SlidingPiece

  attr_reader

  def initialize(name, pos, board)
    super
   = []
  end

  def get_possible_moves
   = moves(move_dir)
  end

  def move_dir
    return "Diagonal"
  end

#END OF CLASS
end

class NullPiece < Piece
  include Singleton

  def initialize
  end

#END OF CLASS
end

class Knight < Piece
  include SteppingPiece

  attr_reader

  def initialize(name, pos, board)
    super
   = []
  end

  def get_possible_moves
   = moves(move_dir)
  end

  def move_dir
    return "Knight"
  end

#END OF CLASS
end

class King < Piece
  include SteppingPiece

  attr_reader

  def initialize(name, pos, board)
    super
   = []
  end

  def get_possible_moves
   = moves(move_dir)
  end

  def move_dir
    return "King"
  end

#END OF CLASS
end

class Pawn < Piece
  attr_reader :possible_moves

  def initialize(color, pos, board)
    super
  end

  def side_attacks
    poss_attacks = []

    if move_direction == -1
      poss_attacks = [[@start_pos[0] - 1, @star_pos[1] - 1], [@start_pos[0] - 1, @star_pos[1] + 1]
    else
      poss_attacks = [[@start_pos[0] + 1, @star_pos[1] + 1], [@start_pos[0] + 1, @star_pos[1] - 1]
    end

    poss_attacks.select do { |attack| @board[attack].class != NullPiece }
  end

  def get_possible_moves
    moves = []
    dir = move_direction

    if starting_row?
      moves = [[start_pos[0], start_pos[1] + dir], [start_pos[0], start_pos[1] + (2 * dir)]]
    else
      moves = [start_pos[0], start_pos[1] + dir]
    end

    if !moves[0].is_a?(NullPiece)
      moves = []
    elsif !moves[1].is_a?(NullPiece)
      moves = [moves[0]]
    end
    moves
  end

  def move_direction
    @color == :white ? -1 : 1
  end

  def starting_row?
    @color == :white ? start_row = 6 : start_row = 1
    @start_pos[0] == start_row
  end


#END OF CLASS
end




if $PROGRAM_NAME == __FILE__
  board = Board.new
  b = King.new("King", [4,4], board)
  b.get_possible_moves
  p b.possible_moves
end
