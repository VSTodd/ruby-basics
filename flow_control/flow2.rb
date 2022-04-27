def all_caps(phrase)
  if phrase.length > 10
    puts phrase.upcase
  else
    puts phrase
  end
end

phrase = gets.chomp
all_caps(phrase)