require_relative "piece.rb"
require_relative "slideable.rb"

class Bishop < Piece
    include Slideable
    def symbol
        :b
    end
    
    private
    def move_dirs
       move_diag
    end
end