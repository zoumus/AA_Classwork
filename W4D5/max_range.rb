def windowed_max_range1(arr, w)
    current_max = nil
    i = 0
    while i < arr.length - w + 1
        sub = arr[i, w].max -  arr[i, w].min
        if current_max == nil || current_max < sub 
            current_max = sub
        end
        i += 1 
    end
    current_max
end
p windowed_max_range1([1, 0, 2, 5, 4, 8], 2) # 4, 8
p windowed_max_range1([1, 0, 2, 5, 4, 8], 3) # 0, 2, 5
p windowed_max_range1([1, 0, 2, 5, 4, 8], 4)   # 2, 5, 4, 8
p windowed_max_range1([1, 3, 2, 5, 4, 8], 5) # 3, 2, 5, 4, 8


class MyQueue

    def initialize
        @store = []
    end

    def peek
        @store.first
    end

    def size
        @store.length
    end
    def empty?
        @store.empty?
    end

    def enqueue(el)
        @store.push(el)
    end

    def dequeue(el)
        @store.unshift(el)
    end
end
