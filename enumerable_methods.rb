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

    #my_all?
    def my_all?

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

#last of module enumerable
end

#to test
array = [1,2,3,4]
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
