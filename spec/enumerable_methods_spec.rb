# frozen_string_literal: true

require_relative '../enumerable_methods.rb'

# good
RSpec.describe Enumerable do
  let(:array) { [1, 2, 3, 4, 5, 6, 7] }
  let(:names) { %w[thais sofi amanda] }

  describe '#my_each' do
    it 'returns the array itself' do
      default_arr = []
      tested_arr = []

      array.each { |x| default_arr << x + 1 }
      array.my_each { |x| tested_arr << x + 1 }
      expect(tested_arr).to eql(default_arr)
    end

    context 'when a block is not given'
    it 'returns an Enumerator when no block given' do
      expect(array.my_each.is_a?(Enumerator)).to be(true)
    end
  end

  describe '#my_each_with_index' do
    it 'the item and its index is returned' do
      default_arr = []
      tested_arr = []

      array.each_with_index { |x, y| tested_arr << [x, y] }
      array.my_each_with_index { |x, y| default_arr << [x, y] }
      expect(tested_arr).to eql(default_arr)
    end

    context 'when a block is not given'
    it 'returns an Enumerator when no block given' do
      expect(array.my_each_with_index.is_a?(Enumerator)).to be(true)
    end

    context 'when a block is not given'
    it 'returns an Enumerator when no block given' do
      expect(names.my_each_with_index.is_a?(Enumerator)).to be(true)
    end
  end

  describe '#my_select' do
    it 'select elements by given specific condition' do
      default_arr = array.select { |x| x < 2 }
      tested_arr = array.my_select { |x| x < 2 }
      expect(tested_arr).to eql(default_arr)
    end
  end

  describe '#my_all?' do
    it 'returns true if all elements are true (or empty array)' do
      default = array.all? { |x| x > 0 }
      tested = array.my_all? { |x| x > 0 }
      expect(tested).to eql(default)
    end

    context 'Argument = Class'
    it 'returns true when all elements belong to the class passed as argument or false when it does not pass' do
      expect(array.my_all?(Integer)).to eql(true)
      expect(array.my_all?(String)).to eql(false)
    end

    context 'Argument = Regexp'
    it 'returns true when all elements match the Regular Expression passed or false when it does not pass' do
      expect(names.my_all?(/[a-z]/)).to eql(true)
      expect(names.my_all?(/d/)).to eql(false)
    end
  end

  describe '#my_any?' do
    it 'returns true if at least one element is true (or non empty array) or false when it does not pass.' do
      default = array.any? { |x| x > 3 }
      tested = array.my_any? { |x| x > 3 }
      expect(tested).to eql(default)
    end

    context 'Argument = Class'
    it 'returns true when all elements belong to the class passed as argument or false when it does not pass' do
      expect(array.my_any?(Integer)).to eql(true)
      expect(array.my_any?(String)).to eql(false)
    end

    context 'Argument = Regexp'
    it 'returns true when all elements match the Regular Expression passed or false when it does not pass' do
      expect(names.my_any?(/[a-z]/)).to eql(true)
      expect(names.my_any?(/z/)).to eql(false)
    end
  end

  describe '#my_none?' do
    it 'returns true if no elements are true (or empty array).' do
      default = array.none? { |x| x == 8 }
      tested = array.my_none? { |x| x == 8 }
      expect(tested).to eql(default)
    end

    context 'Argument = Class'
    it 'returns true when all elements belong to the class passed as argument or false when it does not pass' do
      expect(array.my_none?(Integer)).to eql(false)
      expect(array.my_none?(String)).to eql(true)
    end

    context 'Argument = Regexp'
    it 'returns true when all elements match the Regular Expression passed or false when it does not pass' do
      expect(names.my_none?(/[a-z]/)).to eql(false)
      expect(names.my_none?(/z/)).to eql(true)
    end
  end

  describe '#my_count' do
    it 'takes an enumerable collection and counts how many elements match the given criteria.' do
      default = array.count { |x| x > 5 }
      tested = array.my_count { |x| x > 5 }
      expect(tested).to eql(default)
    end
  end

  describe '#my_map' do
    it 'returns a new array with the results of running block.' do
      default_arr = array.map { |x| x * x }
      tested_arr = array.my_map { |x| x * x }
      expect(tested_arr).to eql(default_arr)
    end
  end

  describe '#my_inject' do
    it 'combines all elements of enum by applying a binary operation' do
      default_arr = array.inject { |x, y| x + y }
      tested_arr = array.my_inject { |x, y| x + y }
      expect(tested_arr).to eql(default_arr)
    end
  end

  describe '#multiply_els' do
    it 'return the product of all the elements of an array' do
      result = multiply_els(array)
      expect(result).to eql(5040)
    end
  end
end
