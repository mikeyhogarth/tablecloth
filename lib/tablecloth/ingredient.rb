module TableCloth
  
  class Ingredient
    attr_accessor :qty, :unit, :item
    
    def initialize(params)
      @qty = params[:qty]
      @unit = params[:unit]
      @item = params[:item]
      
      @qty = 1 if @qty == :na && @unit != :na
    end
    
    #alias for qty
    def quantity
      @qty
    end
    
    #alias for unit
    def units
      @unit
    end
    
    #simple comparison operator
    def ==(other_ingredient)
      @qty == other_ingredient.qty &&
        @unit == other_ingredient.unit &&
        @item == other_ingredient.item
    end
    
    #returns true if this ingredient did not specify a qty or a unit
    def is_free_text?
      @qty == :na && @unit == :na
    end
    
    #This method formats an ingredient into a readable string
    def to_s
      #singular
      return "#{@qty} #{@unit} of #{item}" if @qty == "1"
      
      #basic pluralization
      "#{@qty} #{@unit}s of #{item}"
    end
  
    
  end
  
end
