# write a reduce method that takes an array and optional integer that is 0 at default
# with all numbers in the array being folded into that integer
# input: arrays, optional integer, implicit block
# output: none
# return: integer

# iterate over the array, reassigning the accumulator
# to the block being called with the accumulator and the current element of the array

def reduce(array, acc=0)
  array.each { |num| acc = yield(acc, num) }
  acc
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass