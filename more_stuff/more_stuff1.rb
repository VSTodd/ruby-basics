def has_lab?(word)
  if word =~ /lab/i 
    puts "'#{word}'...we 'lab' to see it!"
  else
    puts "We have 'lab' news..."
  end
end

has_lab?("laboratory")
has_lab?("experiment")
has_lab?("Pans Labyrinth")
has_lab?("elaborate")
has_lab?("polar bear")