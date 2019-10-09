# frozen_string_literal: true

require_relative '../enumerable_methods.rb'

# good
RSpec.describe Enumerable do
    let(:array) {[1, 2, 3, 4, 5, 6, 7]}

    describe "#my_each" do
    it "returns the array itself" do
        
        default_arr = []
        tested_arr = []

        array.each {|x| default_arr << x + 1}
        array.my_each {|x| tested_arr << x + 1}        
        expect(tested_arr).to eql(default_arr)
    end
end

    describe "#my_each_with_index" do
    it "the item and its index is returned" do
        
    default_arr = []
    tested_arr = []

    array.each_with_index {|x, y| tested_arr << [x, y] }
    array.my_each_with_index {|x, y| default_arr << [x, y] }
    expect(tested_arr).to eql(default_arr)
    end
end

    describe "#my_select" do
    it "select elements by given specific condition" do
        
    default_arr = []
    tested_arr = []

    array.select {|x| x < 2 }
    array.my_select {|x| x < 2 }
    expect(tested_arr).to eql(default_arr)
    end
end

    describe "#my_all?" do
    it "returns true if all elements are true (or empty array)" do
    
    default_arr = []
    tested_arr = []

    array.all? {|x| x > 0}
    array.my_all? {|x| x > 0 }
    expect(tested_arr).to eql(default_arr)
    end
end

    describe "#my_any?" do
    it "returns true if at least one element is true (or non empty array)." do
    
    default_arr = []
    tested_arr = []

    array.any? {|x| x > 3}
    array.my_any? {|x| x > 3}
    expect(tested_arr).to eql(default_arr)
    end
end

    describe "#my_none?" do
    it "returns true if no elements are true (or empty array)." do
    
    default_arr = []
    tested_arr = []

    array.none? {|x| x == 8}
    array.my_none? {|x| x == 8}
    expect(tested_arr).to eql(default_arr)
    end
end

    describe "#my_count" do
    it "takes an enumerable collection and counts how many elements match the given criteria." do
    
    default_arr = []
    tested_arr = []

    array.count {|x| x > 5}
    array.my_count {|x| x > 5}
    expect(tested_arr).to eql(default_arr)
    end
end

    describe "#my_map" do
    it "returns a new array with the results of running block." do
    
    default_arr = []
    tested_arr = []

    array.map {|x| x * x}
    array.my_map {|x| x * x}
    expect(tested_arr).to eql(default_arr)
    end
end


end #end of the method?