class Flight

    attr_reader :passengers
    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end

    def full?
        if @passengers.length == @capacity
            return true
        end
        false
    end

    def board_passenger(passenger_1)
        if passenger_1.has_flight?(@flight_number) && !full?
            @passengers << passenger_1
        end
    end

    def list_passengers
        @passengers.map { |passenger| passenger.name}
    end

    def [](index_num)
        @passengers[index_num]
    end

    def <<(passenger_1)
        board_passenger(passenger_1)
    end
end