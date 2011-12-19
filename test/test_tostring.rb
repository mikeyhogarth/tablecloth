require "tablecloth"
require "test/unit"

class TestToString < Test::Unit::TestCase
  
  def test_examples
    
    #test basic singular
    tc = TableCloth::Recipe.new(:ingredients => "a cup of sugar")
    str_ingredient = tc.ingredients.first.to_s
    assert_equal "1 cup of sugar", str_ingredient

    #test basic pluralization
    tc = TableCloth::Recipe.new(:ingredients => "2 cups of sugar")
    str_ingredient = tc.ingredients.first.to_s
    assert_equal "2 cups of sugar", str_ingredient

  end
  
end
