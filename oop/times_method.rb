# the method will take a block and execute it the number of times specified by the argument
# the number parameter is different every iteration, from 0 up to number - 1
# it returns the number

# input: integer and and implicit block
# output: depends on the block
# return: the integer

# create an array of all numbers to be used from 0 to number - 1
# iterate over each num of the array, passing it into the block
# return num

def times(num)
  range = (num-num)..(num-1)
  range.each do |number|
    yield(number)
  end
  num
end

times(5) do |num|
  puts num
end