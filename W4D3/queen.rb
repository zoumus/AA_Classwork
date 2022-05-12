require_relative "piece.rb"
require_relative "slideable.rb"
class Queen < Piece
    include Slideable
    def symbol
        :q
    end
    
    private
    def move_dirs
       move_diag + move_horiz_vert
    end
end