class HumanPlayer

    attr_reader :mark_value
    def initialize(value)
        @mark_value = value
    end

    def get_position
        puts "Player #{mark_value}, enter the position as two numbers with a space between them"
        input = gets.chomp.split(' ').map(&:to_i)
        raise "error" if input.length != 2
        input
    
    end
end