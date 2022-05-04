#Append 11 to the end of the original array. Prepend 0 to the beginning.
array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
array.append(11)
array.prepend(0)
p array

#Get rid of 11. And append a 3.
array.pop
array << 3
p array

#Get rid of duplicates without specifically removing any one value.
array.uniq!
p array