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









end #end of the method?