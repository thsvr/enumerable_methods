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
    def my_all?(par=nil)
      if block_given?
        my_each { |x| return false unless yield(x) }
      elsif par.class == Class
        my_each { |x| return false unless x.class == par }
      elsif par.class == Regexp
        my_each { |x| return false unless x =~ par }
      elsif par.nil?
        my_each { |x| return false unless x }
      else
        my_each { |x| return false unless x == par }
      end
      true
    end

    #my_any? 5
    def my_any?
        var = self
        return var if !block_given?
        my_each do |x|
            if yield(x) == true
                return true
            end
        end 
        false
    end

    #my_none? 6
    def my_none?
        var = self
        var.my_each do |x|
            return false if yield(x)
        end 
        true
    end

    #my_count 7
    def my_count
        var = self
        count = 0
     var.my_each do |y|
      if block_given? && yield(y)
        count += 1
      else
        count = var.length
      end
     end
        count
    end

    #my_map 8
    def my_map proc=nil
        var=self
        result = []
        var.my_each do |x|
            result << ((block_given?)? yield(x):proc.call(x))
        end
        result
    end

    #my_inject 9
    def my_inject(*args)
        arr = to_a.dup
        if args[0].nil?
          operand = arr.shift
        elsif args[1].nil? && !block_given?
          symbol = args[0]
          operand = arr.shift
        elsif args[1].nil? && block_given?
          operand = args[0]
        else
          symbol = args[0]
          operand = args[1]
        end
    
        arr[0..-1].my_each do |i|
          operand = if symbol
                      operand.send(symbol. i)
                    else
                      yield(operand, i)
                    end
        end
        operand
      end
    end
    
    #multiply_els 10
    def multiply_els(value)
        value.my_inject() { |mult, x| mult * x }
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

=begin my_all? 4 working 
array_words.all?() {|word| puts word.length <= 5 } 
puts ""
array_words.my_all?() {|word| puts word.length <= 5 } 
=end

=begin my_any? 5 working 
array_words.any? {|word| puts word.length <= 3 } 
puts ""
array_words.my_any? {|word| puts word.length <= 3 }  
=end

=begin my_none? 6 working 
array_words.none? {|word| puts word.length <= 1 } 
puts ""
array_words.my_none? {|word| puts word.length <= 1 } 
=end

=begin count 7 working
puts array.count 
puts " "
puts array.my_count
=end

=begin my_map 8 working
array.map { |i| puts i*2 } 
puts " "
array.my_map { |i| puts i*2 }
=end

=begin my_inject 9 working
p array.inject { |sum, n| sum ** n }
puts " "
p array.my_inject { |sum, n| sum ** n }
=end

=begin multiply_els 10 working
p multiply_els([2,4,5])
=end