require "colorize"
require_relative 'cursor'
require_relative "board"

class Display

  attr_reader :cursor
  def initialize
    @cursor = Cursor.new([0,0], Board.new)
  end

  def render
    system ("clear")
    cursor.board.grid.each_with_index do |row, idx1|
      row.each_with_index do |space, idx2|
        if [idx1, idx2] == cursor.cursor_pos
          if cursor.selected == false
            if space.nil?
              print "   ".colorize(background: :red)
            else
              print " p ".colorize(background: :red)
            end
          else
            if space.nil?
              print "   ".colorize(background: :green)
            else
              print " p ".colorize(background: :green)
            end
          end
        elsif (idx1.odd? && idx2.odd?) || (idx1.even? && idx2.even?)
          if space.nil?
            print "   ".colorize(background: :blue)
          else
            print " p ".colorize(background: :blue)
          end
        else
          if space.nil?
            print "   ".colorize(background: :yellow)
          else
            print " p ".colorize(background: :yellow)
          end
        end
      end
      puts ""
    end
    puts ""
  end

  def movement_tester
    loop do
      render
      cursor.get_input
    end
  end



#END OF CLASS
end


if $PROGRAM_NAME == __FILE__
  b = Display.new
  b.movement_tester
end
