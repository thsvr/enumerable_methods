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

end #end of the method?