require_relative "piece.rb"
require_relative "nullpiece.rb"
require_relative "rook.rb"
require_relative "pawn.rb"
require_relative "knight.rb"
require_relative "queen.rb"
require_relative "king.rb"
require_relative "bishop.rb"
require "byebug"
class Board

    attr_reader :board

    def initialize()
        @board = Array.new(8){Array.new(8)}
        populate
    end
    def populate
        board.each_with_index do |pos, idx|
             board[1][idx] = Pawn.new(self,[1, idx], :black)
             board[6][idx] = Pawn.new(self,[6, idx], :white)
        end

        board[0] = [Rook.new(self, [0,0], :black), Knight.new(self, [0,1], :black), Bishop.new(self, [0,2], :black), Queen.new(self, [0,3], :black), King.new(self, [0,4], :black), Bishop.new(self, [0,5], :black), Knight.new(self, [0,6], :black), Rook.new(self, [0,7], :black)]
        board[7] = [Rook.new(self, [7,0], :white), Knight.new(self, [7,1], :white), Bishop.new(self, [7,2], :white), Queen.new(self, [7,3], :white), King.new(self, [7,4], :white), Bishop.new(self, [7,5], :white), Knight.new(self, [7,6], :white), Rook.new(self, [7,7], :white)]
        board.each_with_index do |row, idx|
            row.each_with_index do |piece, i|
                if piece == nil
                    board[idx][i] = Nullpiece.instance
                end
            end
        end
    end

    def [](pos)
        return board[pos[0]][pos[1]]
    end

    def []=(pos, piece)
        if valid_pos?(pos)
            board[pos[0]][pos[1]] = piece
        end
    end

    def valid_pos?(pos)
        if (pos[0] < 0 || pos[0] >= 8) || (pos[1] < 0 || pos[1] >= 8)
            return false
            raise "Chose a position from 0 to 7"
        end 
        return board[pos[0]][pos[1]].empty?
    end
    
    def move_piece(start_pos, end_pos)
        if board[start_pos[0]][start_pos[1]].empty? == true
            raise "No piece"
        elsif valid_pos?(end_pos)
            board[start_pos[0]][start_pos[1]], board[end_pos[0]][end_pos[1]] = board[end_pos[0]][end_pos[1]], board[start_pos[0]][start_pos[1]]
        end
    end

    def printer
        @board.each do |rows|
            s = ""
            rows.each do |ele|
                s += ele.to_s
            end
            puts s 
        end
    end

    
end

b = Board.new()
b.printer
