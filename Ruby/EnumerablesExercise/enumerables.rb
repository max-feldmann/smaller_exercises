class Array

    def my_join(seperator = "")    
        new_string = ""

        self.each do |ele|
            new_string << ele + seperator
        end

        new_string
    end
    
    def my_reverse
        new_array = []

            self.each do |ele|
                new_array.unshift(ele)
            end

        return new_array
    end
end

p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse               #=> [1]
p [1, 2, 3, 4, 5, 6, 7].my_reverse