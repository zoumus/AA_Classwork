class Dog
    def initialize(str1, str2, age, str3, arr)
        @name = str1
        @breed = str2
        @age = age
        @bark = str3
        @favorite_foods = arr
    end

    def name
        return @name
    end

    def breed
        return @breed
    end

    def age
        return @age
    end

    def age= (number)
        @age = number
    end

    def bark
       if @age > 3
        return @bark.upcase
       else
        return @bark.downcase
       end
    end

    def favorite_foods
        return @favorite_foods
    end
    
    def favorite_food?(string)
        if @favorite_foods.include?(string.capitalize)
            return true
        end
        false
    end

end

