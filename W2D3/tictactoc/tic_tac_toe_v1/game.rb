require './board.rb'
require './human_player.rb'

class Game

    def initialize(mark_1, mark_2)
        @pl_1 = HumanPlayer.new(mark_1)
        @pl_2 = HumanPlayer.new(mark_2)
        @board = Board.new
        @cur_pl = @pl_1
    end

    def switch_turn
        if @cur_pl == @pl_1
            @cur_pl = @pl_2
        else
            @cur_pl = @pl_1
        end
    end

    def Play
        while Board.empty?(position)
            Board.print
            pos = @cur_pl.get_position
            Board.place_mark(pos, @cur_pl.mark)

            if Board.win?(@cur_pl.mark)
                puts "victory"
                puts @cur_pl.mark.to_s "won!"
                return
            else
                switch_turn
            end
        end
        puts "DRAW"

    end
end