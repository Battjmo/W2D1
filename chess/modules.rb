module SlidingPiece
  DIAG_MOVES = [[1,1], [1,-1], [-1,1], [-1,-1]]
  ORTH_MOVES = [[1,0], [0,1], [-1,0], [0,-1]]

  def moves(move_dir)
    moves = []
    if move_dir == "Diagonal"
      moves = make_moves(DIAG_MOVES, @start_pos)
    elsif move_dir == "Orthagonal"
      moves = make_moves(ORTH_MOVES, @start_pos)
    elsif move_dir == "Queen"
      moves = make_moves(DIAG_MOVES, @start_pos) + make_moves(ORTH_MOVES, @start_pos)
    end
    moves.select {|arr| arr[0].between?(0,7) && arr[1].between?(0,7)}
  end

  def make_moves(orientation, pos)
    moves = []
    orientation.each do |direction|
      next_row = pos[0]
      next_col = pos[1]
      while (next_row).between?(0,7) && (next_col).between?(0,7)
        next_row = next_row + direction[0]
        next_col = next_col + direction[1]
        moves << [next_row, next_col]
      end
    end
    moves
  end



  #END MODULE
end







module SteppingPiece


  #END MODULE
end
