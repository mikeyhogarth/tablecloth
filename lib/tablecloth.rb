require "yaml"

class TableCloth
 
  attr_reader :ingredients

  def initialize val
    
    units_hash = YAML.load_file("lib/yaml/qty.yaml")

    @ingredients = []

    val.each_line do |line|
      @ingredients << parse_single(line, units_hash)
    end    
    
  end
  
  private
  
  def parse_single str, units_hash

    str = presub str
    
    qty = get_qty str
    units = get_units str, units_hash
    item = get_item str, units != :na

    Ingredient.new :qty => qty, :unit => units, :item => item   
    
  end

  def get_qty str
    qty = str.slice(/\d+/)
    if qty == nil
      :na
    else
      qty
    end
  end

  def get_units str, units_hash
    first_word = str.gsub(/\d+/, "").scan(/[a-zA-Z]+/).first
    if units_hash.keys.include? first_word
      units_hash[first_word]
    else
      :na
    end
  end

  def get_item str,has_units
    if has_units
      #assume the first word is the unit
      str.scan(/[a-zA-Z]+/).drop(1).join(" ")
    else
      #assume all non-numerical words are the item
      str.gsub(/\d+/,"").scan(/\w+/).join(" ")
    end
  end

  def presub str
    #TODO: gotta be a better way of doing things than this!
    str.gsub!(/of/, "")
    str.gsub!(/^(a )/, "1")
    str
  end

end

class Ingredient
  attr_accessor :qty, :unit, :item

  def initialize(params)
    @qty = params[:qty]
    @unit = params[:unit]
    @item = params[:item]
  end

  def ==(other_ingredient)
      @qty == other_ingredient.qty &&
      @unit == other_ingredient.unit &&
      @item == other_ingredient.item
  end

  def is_free_text?
    @qty == :na && @unit == :na
  end
end
