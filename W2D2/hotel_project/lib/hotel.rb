require_relative "room"

class Hotel

    def initialize(name, hash)
        @name = name
        @rooms = {}

        hash.each do |room_name, capacity|
            @rooms[room_name] = Room.new(capacity)
        end
    end

    def name
        @name.split.map {|word| word.capitalize}.join(' ')
    end

    def rooms
        @rooms
    end

    def room_exists?(room_name)
        if @rooms.has_key?(room_name)
            return true
        end
        false
    end

    def check_in(person, room_name)
        if self.room_exists?(room_name)
            if @rooms[room_name].add_occupant(person)
                p "check in successful"
            else
                p "sorry, room is full"
            end
        else 
            p "sorry, room does not exist"
        end
    end

    def has_vacancy?
        @rooms.values.any? {|room| room.available_space > 0}
    end

    def list_rooms
        @rooms.each do |room_name, room|
            puts "#{room_name} : #{room.available_space}"
        end
    end
end
    

