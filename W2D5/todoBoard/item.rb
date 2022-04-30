class Item

    def self.valid_date?(date_str)
        date = date_str.split('-').map{ |el| el.to_i }
        year, month, day = date
        if !(1..12).include?(month) || !(1..31).include?(day) 
            return false
        end
        true
    end

    attr_reader :deadline
    attr_accessor :title, :description

    def initialize(title, deadline, description)
        raise 'deadline is not valid' if !Item.valid_date?(deadline)
        @title = title
        @deadline = deadline
        @description = description
    end

    def deadline=(new_deadline)
        raise 'Invalid date' if !Item.valid_date?(new_deadline)
        @deadline = new_deadline
    end

end