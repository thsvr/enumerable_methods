module Enumerable

    #my_each 1
    def my_each
        x = 0
        while x < self.size
            yield(self[x])  
            x+=1      
        end
        self
    end

    #my_each_with_index 2
    def my_each_with_index
        for x in 0...self.size
            yield self[x], x
        end
    end

    #my_select 3
    def my_select
        selected_elements = []
        self.my_each do |x|
            selected_elements << x if yield x
        end
        selected_elements
    end

    #my_all? 4
    def my_all?
        var = self
        result = []
        var.my_each do |x|
            if yield(x)
                result << x
            end
        end
        result
    end

    #my_any?
    def my_any?

    end

    #my_none?
    def my_none?

    end

    #my_count
    def my_count

    end

    #my_map
    def my_map

    end

    #my_inject
    def my_inject

    end

#last end of module enumerable
end

#to test
array = [1,2,3,4]
array_words = ["one", "two", "three", "four"]
=begin my_each 1 working
array.each { |number| puts number ** 3}
puts ''
array.my_each { |number| puts number ** 3}
=end

=begin my_each_with_index 2 working
array.each_with_index {|number, index| puts array [number] = index}
puts ""
array.my_each_with_index {|number, index| puts array [number] = index}
=end

=begin my_select 3 working
array.select {|num| puts num.even? }
puts ""
array.my_select {|num| puts num.even? }
=end

#begin my_all 4 working but the output is different
array_words.all? {|word| puts word.length <= 5 } #output true
puts ""
array_words.my_all? {|word| puts word.length <= 5 } #output true true true true
#end
