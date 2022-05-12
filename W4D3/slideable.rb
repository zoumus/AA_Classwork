module Slideable
    DIAG = [
        [-1,1],
        [1,1],
        [1,-1],
        [-1,-1]
    ]

    VERT_HORIZ = [
        [0,1],
        [0,-1],
        [-1,0],
        [1,0]
    ]

    def move_diag 
        return DIAG
    end

    def move_horiz_vert
        return VERT_HORIZ
    end

    def move
        valid_positions = []
        move_dirs.each do |position|
            rows = position[0]
            cols = position[1]
            possible_pos = [current_pos[0] + rows, current_pos[1] + cols]
            # p "sup"
            # p possible_pos
            # p current_pos
            # p board[possible_pos]
            # p board[current_pos]
            # p "abcs"
            # p board[possible_pos].color 
            # p board[current_pos].color
            # p board[possible_pos].empty?
            while true
                # p board[possible_pos].color 
                # p board[current_pos].color
                # p board[possible_pos].empty?
                if board.valid_pos?(possible_pos)
                    valid_positions << possible_pos
                    possible_pos = [possible_pos[0] + rows, possible_pos[1] + cols]
                    # p "ono"
                    # p possible_pos
                    begin 
                        if !board.valid_pos?(possible_pos)
                            break
                        end
                    rescue
                        break
                    end
                elsif board != nil && !(board[possible_pos].empty?) && board[possible_pos].color != board[current_pos].color
                    # p "b"
                    valid_positions << possible_pos
                    break
                else
                    # p "c"
                    break
                end
            end
        end
        valid_positions
    end
    
    private
    def move_dirs
    end
end