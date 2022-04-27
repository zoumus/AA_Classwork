class GuessingGame

    def initialize(min, max)
        @secret_num = rand(min..max)
        @num_attempts = 0
        @game_over = false
    end

    def num_attempts
        @num_attempts
    end

    def game_over?
        @game_over
    end

    def check_num(num)
        @num_attempts += 1

        if @secret_num < num
            p "too big"
        elsif @secret_num > num
            p "too smalll"
        else
            @game_over = true
            p "you win"  
        end
    end

    def ask_user
        p "enter a number"
        num_str = gets.chomp.to_i
        self.check_num(num_str)
    end

end
