# create a method that calls the implicit block with every element of the array
# parameter and then returns the array

#input: array and implicit block
#output: depends
#returns: original array

# have a counter set to zero
# call a loop
# pass array into the block at the element specified by zero
# add 1 to counter
# break loop if counter is greater than the length of the array
# return the array

def each(arr)
  counter = 0
  loop do
    yield(arr[counter])
    counter += 1
    break if counter >= arr.length
  end
  arr
end


each([1, 2, 3, 4, 5]) do |num|
  puts num
end

# 1
# 2
# 3
# 4
# 5
# => [1, 2, 3, 4, 5]