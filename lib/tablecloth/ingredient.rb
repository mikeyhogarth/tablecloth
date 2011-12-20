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
    
    
    #parse a single line from the ingredients list
    def self.parse str, units_hash
      
      str = presub str
      
      qty = get_qty str
      units = get_units str, units_hash
      item = get_item str, units != :na
      
      Ingredient.new :qty => qty, :unit => units, :item => item   
      
    end
    
    private
    #extrac the quantity from the string
    def self.get_qty str
      
      #check for fractions first, then single units
      qty = str.slice(/\d+\/\d+/) || str.slice(/\d+/)
      
      if qty.nil?
        :na
      else
        qty
      end
    end
    
    #extract the units from the string
    def self.get_units str, units_hash
      first_word = str.gsub(/\d+/, "").scan(/[a-zA-Z]+/).first
      if units_hash.keys.include? first_word
        units_hash[first_word]
      else
        :na
      end
    end
    
    #extract the item itself from the string
    def self.get_item str,has_units
      if has_units
        #assume the first word is the unit
        str.scan(/[a-zA-Z]+/).drop(1).join(" ")
      else
        #assume all non-numerical words are the item
        str.gsub(/\d+/,"").scan(/\w+/).join(" ")
      end
    end
    
    #processes any pre-substitutions to the string 
    def self.presub str
      #TODO: there's gotta be a better way of doing things than this!
      str.gsub!(/of/, "") #deal with "1 cup of sugar"
      str.gsub!(/^(a )/, "1") #turn "a cup of sugar" into "1 cup of sugar"
      str.gsub!(/ a /,"") #deal with "1/2 a cup of sugar"
      str
    end   
  end
  
  class Ingredients < Array
    def to_html *args
      return String.new if self.empty?

      if(!args.empty?)
        raise ArgumentError if args.size > 1

        html_class = " class = '#{args.first[:class]}'" if args.first[:class]
        html_id = " id = '#{args.first[:id]}'" if args.first[:id]

      end
      
      html = "<ul#{html_id}#{html_class}>"
      
      self.each do |ingredient|
        html << "<li>#{ingredient.to_s}</li>"
      end      
      
      html << "</ul>"
    end
  end
  
end
