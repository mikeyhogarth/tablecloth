#This file just generates the qty.yaml file which will basically be used when normalizing strings into symbols

require "yaml"

quantities = {
  "lbs" => :lb,
  "lb" => :lb,
  "kg" => :kg,
  "g" => :gram,
  "gram" => :gram,
  "grams" => :gram,
  "tsp" => :teaspoon,
  "teaspoon" => :teaspoon,
  "tea spoon" => :teaspoon,
  "tbs" => :tablespoon,
  "tbsp" => :tablespoon,
  "tablespoon" => :tablespoon,
  "table spoon" => :tablespoon,
  "pinch" => :pinch,
  "a pinch" => :pinch,
  "cup" => :cup,
  "cups" => :cup,
  "ounces" => :ounce,
  "oz" => :ounce
}

File.open("qty.yaml", "w") do |file|
  file.puts quantities.to_yaml
end
