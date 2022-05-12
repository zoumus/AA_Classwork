require_relative "piece.rb"
class Pawn < Piece
    
    def symbol
        :pw
    end

    def move
        attack_steps + forward_steps
    end

    private

    def forward_dir
        if color == :white
            return -1
        else
            return 1
        end
    end
    
    def at_start_row?
        if color == :black && current_pos[0] == 1
            return true
        elsif color == :white && current_pos[0] == 6
            return true
        end
        return false
    end

    def forward_steps
        for_steps = []
        row, col = current_pos
        step = [row + forward_dir, col]
        for_steps << step if board.valid_pos?(step)
        if at_start_row?
            new_step = [row + 2*forward_dir, col]
            for_steps << new_step if board.valid_pos?(new_step)
        end
        for_steps
    end

    def attack_steps
        attack_pos = []
        i, j = current_pos
        attacks = [i + forward_dir, j + 1],[i + forward_dir, j - 1]
        attacks.select do |pos|
            if board[pos].color != color && board[pos].color != :none
                attack_pos << pos
            end
        end
        attack_pos
    end
end