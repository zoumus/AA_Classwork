# n^2
def two_sum1?(arr, target)
    arr.each_with_index do |ele1, i1|
        arr.each_with_index do |ele2, i2|
            return true if arr[i1] + arr[i2] == target && i2 > i1
        end 
    end 
    return false
end
arr = [0, 1, 5, 7]
p two_sum1?(arr, 6) # => should be true
p two_sum1?(arr, 10) # => should be false


def two_sum2?(arr, target)
    sorted = arr.sort
    i = 0
    while i < sorted.length
        y = target - sorted[i]
        return true if bsearch(sorted[i+1..-1],y)
        i += 1
    end
    return false
end

def bsearch(arr, target)
    return nil if arr.length == 0
    m = arr.length / 2
    left = arr[0...m]
    right = arr[m+1..-1]
    return true if arr[m] == target

    if target < arr[m]
        return bsearch(left, target)
    else
        stack = bsearch(right, target)
        if stack
            return stack + m + 1
        else
            return nil
        end
    end 
    return false
end

p two_sum2?(arr, 6) # => should be true
p two_sum2?(arr, 10) # => should be false
# n
def two_sum3?(arr, target) 
    hash = {}

    arr.each do |num|
        y = target - num
        if hash[y]
            return true
        else
            hash[num] = y
        end
    end
    return false
end
p two_sum3?(arr, 6) # => should be true
p two_sum3?(arr, 10) # => should be false
# nlog n
def two_sum4?(arr, target)
    sorted = arr.sort

    i = 0
    j = sorted.length - 1
    while i < j
        if sorted[i] + sorted[j] < target
            i += 1
        elsif sorted[i] + sorted[j] > target
            j -= 1
        else
            return true
        end
    end
    return false
end
p two_sum4?(arr, 6) # => should be true
p two_sum4?(arr, 10) # => should be false



