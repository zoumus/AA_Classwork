require './item.rb' 
class List

    attr_accessor :label

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description = '')
        if Item.valid_date?(deadline)
            @items << Item.new(title, deadline, description)
            return true
        end
        false
    end

    def size
        @item.length
    end

    def valid_index?(index_num)
        index_num < 0 && index_num < self.size
    end

    def swap(idx1, idx2)
        return false if !valid_index?(idx1) || !valid_index?(idx2)
        @item[idx1], @item[idx2] = @item[idx2], @item[idx1]
        true
    end

end