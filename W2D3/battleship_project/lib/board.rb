class Board

    attr_reader :size

    def initialize(number)
        @grid = Array.new(number){Array.new(number, :N)}
        @size = number * number
    end

    def [](pos)
        i, j = pos
        @grid[i][j]
    end

    def []=(pos, val)
        i, j = pos
        @grid[i][j] = val
    end

    def num_ships
        @grid.flatten.count { |el| el == :S }
    end

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            puts "you sunk my battleship!"
            return true
        else 
            self[pos] = :X
            return false
        end
    end

    def place_random_ships
        grid_elements = @size * 0.25
        
        while self.num_ships < grid_elements
            rand_row = rand(0...@grid.length)
            rand_col = rand(0...@grid.length)
            pos = rand_row, rand_col
            self[pos] = :S
        end
    end


    def hidden_ships_grid
        @grid.map do |subarr|
            subarr.map do |el|
                if el == :S
                    :N 
                else
                    el
                end
            end
        end
    end

    def self.print_grid(grid)
        grid.each do |subarr|
            puts subarr.join(' ')
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end
end
