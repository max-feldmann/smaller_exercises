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

class Array

    def deep_duplicate
        new_array = []

        self.each do |ele|
            new_array << el.is_a?(Array) ? el.deep_dup : el
        end

        new_array
    end
end

# ----------- FIBAONACCI ITERATIVE VS RECURSIVE ---------------

    def iterative_fibonacci(n)
        return [] if n == 0
        return [0] if n == 1

        fibs = [0,1]
        
        while fibs.count < n
            fibs << fibs[-1] + fibs[-2]
        end

        fibs
    end

    def recursive_fibonacci(n)
        if n <= 2
            [0,1].take(n)
        else
            fibs = recursive_fibonacci(n-1)
            fibs << fibs[-1] + fibs[-2]
        end
    end

    # p "Iterative Fibonacci Solution"
    # p iterative_fibonacci(9)
    # p ""
    # p "Recursive Fibonacci Solution"
    # p recursive_fibonacci(9)


# ------- BINARY SEARCH ALGORITHM ----------

# Find the target number in a sorted array (array HAS to be sorted. doesn´t work otherwise)
# If array´s length is 0, nil is returned
# otherwise we take the element at index array.length / 2 (middle el)
# we compare that el to the target. if it is the same, we return its index (arary.length/2)
# if not we go into case comparion (realised here with if,else)
# if target is smaller than middle element
    # call method again inserting original array until and not including middle ele
    # it again slices the array and checks
# if target is bigger than middle element
    # we build a subset of original arr by using drop 
        # we drop the first elements of arr until middle el +1 
        # new array is returned, original array stays the same
    # we call bsearch again on that new subset, which is the second half
    # and so on

def bsearch(array, target)
    return nil if array.length == 0
    
    middle_idx = array.length / 2
    middle_el = array[middle_idx]

    if target == middle_el
        return middle_idx
    end

    if target < middle_el
        bsearch(array[0...middle_idx], target)
    else
        sub_set = bsearch(array.drop(middle_idx+1), target)
        sub_set.nil? ? nil : (middle_idx + 1) + sub_set
    end
            
end

p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil
    