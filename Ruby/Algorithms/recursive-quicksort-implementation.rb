class Array
    # Monkey-patched onto the array-class for convenience. 
    # Quicksort can thus be called directly on any array

    def quicksort

        return self.dup if self.length <= 1 
        # base case: if the array is empty or has length 1, there is no sorting to be done
        # in that case return the array
        # .dup => we want to return a copy of the original array, therefore add dup
        
        pivot = self.first # first element of array is the one we use to do structuring aroudn
        left = self.drop(1).select { |el| el < pivot} 
            # => select all elements smaller than pivot to "left"
            # => .drop returns new array with first element (our pivot ele) left out
        right = self.drop(1).select { |el| el >= pivot}
            # => rest of elements goes into right-array
            # => duplicates of pivot element are selected into right-array
        
        right_sorted = right.quicksort
        left_sorted = left.quicksort
            # => By calling quicksort on right, and left we establish the recursive case.
            # => for as long as self is an array longer than 1, quicksort will be called on it continuously
            # => putting new recursions on the stack
            # => method never resolves unless we reach a point where all return an ordered array

        left_sorted + [pivot] + right_sorted
            # => in the end, if all of the above is resolved we just add the different pieces together
    end
end

array = [1, 4, 6, 2, 6, 7, 2, 1, 0, 9, 5, 4, 8, 1, 2, 1, 1, 0, 7, 6, 5, 8, 9]

p array.quicksort