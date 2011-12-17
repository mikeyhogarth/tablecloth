require "yaml"

quantities = {
  "lbs" => :lbs,
  "lb" => :lbs,
  "kg" => :kg,
  "g" => :grams,
  "gram" => :grams,
  "grams" => :grams,
  "tsp" => :teaspoon,
  "teaspoon" => :teaspoon,
  "tea spoon" => :teaspoon,
  "tbs" => :tablespoon,
  "tbsp" => :tablespoon,
  "tablespoon" => :tablespoon,
  "table spoon" => :tablespoon,
  "pinch" => :pinch,
  "a pinch" => :pinch,
  "cup" => :cups,
  "cups" => :cups
}

File.open("qty.yaml", "w") do |file|
  file.puts quantities.to_yaml
end
