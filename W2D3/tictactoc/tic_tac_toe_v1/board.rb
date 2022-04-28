class Board

    def initialize
        @grid = Array.new(3){Array.new(3, "_")}
    end

    def [](position)
        i, j = position
        @grid[i][j]
    end

    def []=(position, val)
        i, j = position
        @grid[i][j] = val
    end

    def valid?(position)
        i, j = position
        position.all? do|el|
            if el >= 0 && el < @grid.length
                return true
            end
        end
    end


    def empty?(position)
        self[position] == "_"
    end

    def place_mark(position, mark)
        raise "error" if !valid?(position) || !empty?(position)
        self[position] = mark
    end

    def print
        @grid.each do |row|
            puts row.join(" ")
        end
    end

    def win_row?(mark)
        @grid.any? {|row| row.all? {|el| el == mark}}
    end

    def win_col?(mark)
        @grid.transpose.any? {|col| col.all? {|el| el == mark}}
    end

    def win_diagonal?(mark)
        l_r = (0...@grid.length).all? do |i|
            pos = i, i
            self[pos] == mark
        end
        r_l = (0...@grid).all? do |i|
            pos = i, @grid.length - 1 - i 
            self[pos] == mark
        end
        l_r || r_l
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.flatten.any? {|el| el == "_"}
    end
end