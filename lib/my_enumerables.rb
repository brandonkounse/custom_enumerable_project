# frozen_string_literal: true

module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0
    if block_given?
      my_each do |i|
        yield(i, index)
        index += 1
      end
    end
    self
  end

  def my_select
    selected = []
    my_each { |i| selected << i if yield(i) }
    selected
  end

  def my_all?
    bool = true
    my_each do |i|
      if yield(i) == false
        bool = false
      end
    end
    bool
  end

  def my_any?
    bool = false
    my_each do |i|
      if yield(i) == true
        bool = true
      end
    end
    bool
  end

  def my_none?
    bool = []
    my_each do |i|
      bool << yield(i)
    end
    if bool.my_any? { |i| i == true }
      bool = false
    else
      bool = true
    end
    bool
  end

  def my_count
    count = 0
    if block_given?
      my_each { |i| count += 1 if yield(i) }
    else
      count = self.length
    end
    count
  end

  def my_map; end

  def my_inject; end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for i in self
      yield(i)
    end
    self
  end
end
