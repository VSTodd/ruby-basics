# build a select method that takes an array, puts each element of the array through
# an implicit block, and returns a new array of all elements that returned true

# input: array and implicit block
# output: depends, usually nothing
# returned: a new array

# create a counter set to zero, a new empty array, and a loop
# break out of the loop if counter is the same or greater than the length of the array
# have a conditional for if the current element in array put through the both is truthy
  # if so, add the element to the new array
# increase counter by 1
# return the new array

def select(arr)
  new_arr = []
  counter = 0
  while counter < arr.length
    new_arr << arr[counter] if yield(arr[counter])
    counter += 1
  end
  new_arr
end

array = [1, 2, 3, 4, 5]

p select(array) { |num| num.odd? }      # => [1, 3, 5]
p select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
p select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true