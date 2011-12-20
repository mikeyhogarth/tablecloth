#This file just generates the qty.yaml file which will basically be used when normalizing strings into symbols

require "yaml"

quantities = {
  
  #pounds
  "lbs" => :lb,
  "lb" => :lb,
  "pounds" => :lb,
  "pound" => :lb,

  #kilograms
  "kilogram" => :kg,
  "kilograms" => :kg,
  "kilo" => :kg,
  "kilos" => :kg,
  "kgs" => :kg,
  "kg" => :kg,

  #grams
  "g" => :gram,
  "gram" => :gram,
  "grams" => :gram,

  #teaspoonse
  "ts" => :teaspoon,
  "tsp" => :teaspoon,
  "teaspoon" => :teaspoon,
  "tea spoon" => :teaspoon,

  #tablespoons
  "tbs" => :tablespoon,
  "tbsp" => :tablespoon,
  "tablespoon" => :tablespoon,
  "table spoon" => :tablespoon,

  #pinches
  "pinch" => :pinch,
  "a pinch" => :pinch,

  #cups
  "cup" => :cup,
  "cups" => :cup,
  
  #ounces
  "ounces" => :ounce,
  "ounce" => :ounce,
  "oz" => :ounce,
  "ozs" => :ounces
}

File.open("qty.yaml", "w") do |file|
  file.puts quantities.to_yaml
end
