four_digit = 4389
thousand = four_digit / 1000
hundred = four_digit % 1000 / 100
ten = four_digit % 1000 % 100 / 10
one = four_digit % 1000 % 100 % 10

puts "#{four_digit} = #{thousand} + #{hundred} + #{ten} + #{one}"