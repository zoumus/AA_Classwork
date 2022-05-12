require_relative "piece.rb"
require_relative "slideable.rb"
class Rook < Piece
    include Slideable
    def symbol
        :r
    end
    
    private
    def move_dirs 
       move_horiz_vert
    end
end