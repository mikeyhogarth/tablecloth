#Base class
module TableCloth
  class Recipe
    
    attr_reader :ingredients, :method
    
    def initialize *args    
      
      @method = []
      @ingredients = Ingredients.new
      
      #nothing left to do if no args passed in
      return if args.size == 0
      
      #couple of syntax checks
      params = args.first
      raise ArgumentError if params.empty? || params.class != Hash     

      parse_ingredients params[:ingredients] 
      
    end
    
    #add ingredients straight into tablecloth instance
    def parse_ingredients ingredients
      return if ingredients.nil?

      units_hash = YAML.load_file("lib/tablecloth/yaml/qty.yaml")
      
      ingredients.each_line do |line|
        @ingredients << TableCloth::Ingredient.parse(line, units_hash)
      end    
    end    
  end
end
