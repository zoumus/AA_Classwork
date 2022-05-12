module Stepable

    def move
        valid_positions = []
        move_diffs.each do |position|
            rows = position[0]
            cols = position[1]
            possible_pos = [current_pos[0] + rows, current_pos[1] + cols]
            if board.valid_pos?(possible_pos)
                valid_positions << possible_pos
            elsif board[possible_pos[0]][possible_pos[1]].color != board[current_pos[0]][current_pos[1]].color
                valid_positions << possible_pos
            end
        end
        valid_positions
    end

    def move_diffs
    end
end