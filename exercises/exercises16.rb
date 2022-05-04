#programmatically loop or iterate over the contacts hash from exercise 11, and populate the associated data from the contact_data array. 
#Hint: you will probably need to iterate over ([:email, :address, :phone]), and some helpful methods might be the Array shift and first methods.

contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]
contacts = {"Joe Smith" => {}}
types = [:email, :address, :phone]

contacts.each do |name,info|
  types.each do |types|
  info[types] = contact_data.shift
  end
end

puts contacts