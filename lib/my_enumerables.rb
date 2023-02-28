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
