class Piece
    attr_accessor :board, :current_pos, :color
    def initialize(board, current_pos, color)
        @board = board
        @current_pos = current_pos
        @color = color
    end

    def symbol
        raise "Forgot to overload"
    end 

    def empty?
        return false
    end

    def to_s
        if symbol == :ki
            if color == :white
                return " ♔ "
            else
                return " ♚ "
            end
        elsif symbol == :q
            if color == :white
                return " ♕ "
            else
                return " ♛ "
            end
        elsif symbol == :kn
            if color == :white
                return " ♘ "
            else
                return " ♞ "
            end
        elsif symbol == :r
            if color == :white
                return " ♖ "
            else
                return " ♜ "
            end
        elsif symbol == :pw
            if color == :white
                return " ♙ "
            else
                return " ♟ "
            end 
        elsif symbol == :b
            if color == :white
                return " ♗ "
            else
                return " ♝ "
            end 
        elsif symbol == :empty
            return " _ "
        end
    end
end