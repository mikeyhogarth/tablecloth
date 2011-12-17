require "test/unit"
require "tablecloth"
  
class TestExamples < Test::Unit::TestCase

  def test_full_qtyunititem_syntax

    ex1 = TableCloth.new("2lbs Potatoes")
    ex2 = TableCloth.new("2 lbs Potatoes")
    ex3 = TableCloth.new("2 lb Potatoes")
    ex4 = TableCloth.new("2lb Potatoes")

    ex1_first_ingredient = ex1.ingredients.first

    assert_equal "2", ex1_first_ingredient.qty
    assert_equal :lbs, ex1_first_ingredient.unit
    assert_equal "Potatoes", ex1_first_ingredient.item

    assert_equal ex1.ingredients.first, ex2.ingredients.first, "First Comparison"
    assert_equal ex1.ingredients.first, ex3.ingredients.first, "Second Comparison"
    assert_equal ex1.ingredients.first, ex4.ingredients.first, "Third Comparison"    
  end

  def test_awkward_syntax
    tb = TableCloth.new("1 tablespoon of sugar")
    test_ingredient = Ingredient.new :qty => "1", :unit => :tablespoon, :item => "sugar"
    assert_equal tb.ingredients.first, test_ingredient

    tb = TableCloth.new("1 bouquet garni")
    test_ingredient = Ingredient.new :qty => "1", :unit => :na, :item => "bouquet garni"
    assert_equal tb.ingredients.first, test_ingredient

    tb = TableCloth.new("a cup of sugar")
    test_ingredient = Ingredient.new :qty => "1", :unit => :cups, :item => "sugar"
    assert_equal tb.ingredients.first, test_ingredient

    tb = TableCloth.new("salt to taste")
    test_ingredient = Ingredient.new :item => "salt to taste", :qty => :na, :unit => :na
    assert test_ingredient.is_free_text?, "test comparison"
    
    assert_equal tb.ingredients.first, test_ingredient, "free text test"
    
  end
end
