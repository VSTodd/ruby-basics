def countdown(x)
  puts x
  if x > 0
    countdown (x-1)
  else
    puts "All done!"
  end
end

countdown(12)