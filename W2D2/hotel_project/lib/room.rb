class Room

    def initialize(capacity)
        @capacity = capacity
        @occupants = []
    end

    def capacity
        @capacity
    end

    def occupants
        @occupants
    end

    def full?
        return false if @occupants.length < @capacity
        true
    end

    def available_space
        @capacity - @occupants.length
    end

    def add_occupant(visiter)
        if self.full?
            return false
        else
            @occupants << visiter
            return true
        end
    end

end