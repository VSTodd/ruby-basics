ratties = {brown: "Penelope", beige: "Charlotte", white: "Mrs. Brisby"}
ratties.each_key {|k| puts "The color of her hood is #{k}"}
ratties.each_value {|v| puts "Her name is #{v}"}
ratties.each {|k,v| puts "#{v} has a #{k} hood"}