require "byebug"

def range(min, max)
    return [] if max <= min

   range(min, max - 1) << max - 1
   #[min] + range(min + 1, max)
end

def range_iter(min, max)
    new_arr = []
    (min...max).each do |i|
        new_arr << i
    end
    new_arr
end

# []
# range(4, 5) << 4 # [] << 4
# range(3, 5) << 3 # [4] << 3
# range(2, 5) << 2 # [4, 3] << 2
# range(1, 5) << 1 # [4, 3, 2] << 1

def exp_1(base, exp)
    return 1 if exp == 0
    base * exp_1(base, exp - 1)
end

# p exp_1(2, 0)

def exp_2(base, exp)
   return 1 if exp == 0
   return base if exp == 1

   half = exp_2(base, exp/2) ** 2
   if exp.even?
    half
   else 
    base * half 
   end
end

class Array

    def deep_dup
        new_arr = self.map do |ele|
            if ele.is_a? Array
                ele.deep_dup
            else
                ele
            end
        end
        new_arr
    end
end

def fibs(n)
    return [] if n == 0
    return [0] if n == 1
    return [0, 1] if n == 2
    prev = fibs(n - 1)
    prev << prev[-1] + prev[-2]
end

def bsearch(arr, target)
    return nil if arr.empty?
    mid = arr.length/2
    return mid if arr[mid] == target

    left = arr[0...mid]
    right = arr[mid + 1..-1]

    if arr[mid] > target
        bsearch(left, target)
    else
        stack = bsearch(right, target)
        if stack
            stack + left.length + 1
        else
            return nil
        end
    end      
end

class Array

    def merge_sort
        return self if self.length <= 1

        half = self.length / 2

        left = self[0...half]
        right = self[half..-1]
        merge(left.merge_sort, right.merge_sort)
    end
end

def merge(arr1, arr2)
    sorted = []
    while !arr1.empty? && !arr2.empty?
        if arr1.first < arr2.first
            sorted << arr1.shift
        else 
            sorted << arr2.shift
        end
    end
    if !arr1.empty? || !arr2.empty?
        sorted += arr1 + arr2
    end
    sorted
end

def subsets(arr)
    # debugger
    return [[]] if arr.empty?
    prev = subsets(arr[0...-1])
    # new_arr = prev.deep_dup
    new_arr = prev.map do |subarr|
        subarr +=  [arr[-1]]
    end
    prev + new_arr
end

def permutations(arr)
    return [arr] if arr.length <= 1

    prev = permutations(arr[0...-1])
    perms = []
    arr.each_index do |i|
        
    end


end
