class Passenger

    attr_reader :name
    def initialize(name)
        @name = name
        @flight_numbers = []
    end

    def has_flight?(string)
        if @flight_numbers.include?(string.upcase)
            return true
        end
        false
    end

    def add_flight(string)
        if !has_flight?(string)
            @flight_numbers << string.upcase
        end
    end
end