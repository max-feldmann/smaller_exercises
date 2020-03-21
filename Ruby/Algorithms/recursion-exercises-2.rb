# ----WARMUP----------

# Write a recursive method, range, 
# that takes a start and an end and returns an array of all numbers in that range exclusive.
# For example, range(1,5) should return [1,2,3,4]. 
# If end < start, you can return an empty array

def range(start,ending)
    return [] if ending <= start

    range(start, ending-1) << ending -1
end

# p range(1,5)

# Write both a recursive and iterative Verson of sum of an array

def it_arr_sum(array)
    sum = 0
    array.each {|ele| sum += ele}
    return sum
end

#p it_arr_sum([1,2,3,4,-100])

def rec_arr_sum(arr)
    return arr.first if arr.length == 1
    arr.first + rec_arr_sum(arr.drop(1))
end

p rec_arr_sum([1,2,3,4,5,7])