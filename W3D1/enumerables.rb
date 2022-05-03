class Array

    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end
        self
    end

    def my_select(&prc)
        selected = []
        self.my_each do |ele|
            selected << ele if prc.call(ele)           
        end
        selected
    end

    def my_reject(&prc)
        not_rejected = []
        self.my_each do |ele|
            not_rejected << ele if !prc.call(ele)
        end
        not_rejected
    end

    def my_any?(&prc)
        self.my_each do |ele|
            return true if prc.call(ele)
        end
        false
    end

    def my_all?(&prc)
        self.my_each do |ele|
            return false if !prc.call(ele)
        end
        true
    end

    def my_flatten
        flatten = []
        self.my_each do |ele|
            if ele.is_a? Array
                flatten += ele.my_flatten
            else
                flatten << ele
            end
        end
        flatten
    end

    def my_zip (*arrs) 
        zipped = []
        (0...self.length).each do |i|
            arr = [self[i]]
            arrs.my_each do |subarr|
                arr << subarr[i]
            end
            zipped << arr
        end
        zipped
    end

    def my_rotate(position = 1)
        new_arr = self[0...self.length]
        if position < 0
            (position * (-1)).times do
                el = new_arr.pop
                new_arr.unshift(el)
            end
        else
            position.times do
                el = new_arr.shift
                new_arr.push(el)
            end
        end
        new_arr
    end

    a = [ "a", "b", "c", "d" ]
p a.my_rotate         #=> ["b", "c", "d", "a"]
p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

end