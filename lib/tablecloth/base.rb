#Base class
class TableCloth
  
  attr_reader :ingredients

  def initialize val
    
    units_hash = YAML.load_file("lib/tablecloth/yaml/qty.yaml")

    @ingredients = []

    val.each_line do |line|
      @ingredients << parse_single(line, units_hash)
    end    
    
  end

  #NOT YET IMPLEMENTED: will return entire ingredient list an html ul, can be overriden to include html attributes
  def to_html
    #TODO
    raise NotImplementedError
  end

  private
  
  #parse a single line from the ingredients list
  def parse_single str, units_hash

    str = presub str
    
    qty = get_qty str
    units = get_units str, units_hash
    item = get_item str, units != :na

    Ingredient.new :qty => qty, :unit => units, :item => item   
    
  end

  #extrac the quantity from the string
  def get_qty str

    #check for fractions first, then single units
    qty = str.slice(/\d+\/\d+/) || str.slice(/\d+/)

    if qty == nil
      :na
    else
      qty
    end
  end

  #extract the units from the string
  def get_units str, units_hash
    first_word = str.gsub(/\d+/, "").scan(/[a-zA-Z]+/).first
    if units_hash.keys.include? first_word
      units_hash[first_word]
    else
      :na
    end
  end

  #extract the item itself from the string
  def get_item str,has_units
    if has_units
      #assume the first word is the unit
      str.scan(/[a-zA-Z]+/).drop(1).join(" ")
    else
      #assume all non-numerical words are the item
      str.gsub(/\d+/,"").scan(/\w+/).join(" ")
    end
  end

  #processes any pre-substitutions to the string 
  def presub str
    #TODO: there's gotta be a better way of doing things than this!
    str.gsub!(/of/, "") #deal with "1 cup of sugar"
    str.gsub!(/^(a )/, "1") #turn "a cup of sugar" into "1 cup of sugar"
    str.gsub!(/ a /,"") #deal with "1/2 a cup of sugar"
    str
  end

end
