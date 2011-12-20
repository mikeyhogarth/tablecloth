require "tablecloth"

quit_strings = %w{quit q}

puts "\nTABLECLOTH INGREDIENTS TEST CLIENT\n====================================="
puts "type q or quit to quit, otherwise type ingredients seperated by a comma to see what they get parsed into."

loop do
  print "> ";@input = gets.chomp!

  break if quit_strings.include? @input

  tb = TableCloth::Recipe.new(:ingredients => @input)
  
  print ">>"

  tb.ingredients.each do |ingredient|
    puts "QTY: #{ingredient.qty}, UNIT: #{ingredient.unit}, ITEM: #{ingredient.item}"
  end

end

puts "bye!"
