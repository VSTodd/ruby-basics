puts "Gimme a number between 0 and 100!"
number = gets.chomp.to_i

if (number <= 50) && (number > 0) 
  puts "The number is between 0 and 50!"
elsif (number > 50) && (number <= 100)
  puts "The number is between 51 and 100!"
else
  puts "Hey! That's not a valid number"
end 

  
  


