#This file contains tests for specific examples

require "test/unit"
require "tablecloth"
  
class TestExamples < Test::Unit::TestCase

  def test_basic_parsing

    ex1 = TableCloth::Recipe.new(:ingredients => "2lbs Potatoes")
    ex2 = TableCloth::Recipe.new(:ingredients => "2 lbs Potatoes")
    ex3 = TableCloth::Recipe.new(:ingredients => "2 lb Potatoes")
    ex4 = TableCloth::Recipe.new(:ingredients => "2lb Potatoes")

    assert_equal ex1.ingredients.first, ex2.ingredients.first, "First Comparison"
    assert_equal ex1.ingredients.first, ex3.ingredients.first, "Second Comparison"
    assert_equal ex1.ingredients.first, ex4.ingredients.first, "Third Comparison"    
  end

  def test_qty_fractions
    tb = TableCloth::Recipe.new(:ingredients => "1/2 a cup of sugar")
    test_ingredient = TableCloth::Ingredient.new :qty => "1/2", :unit => :cup, :item => "sugar"
    assert_equal tb.ingredients.first, test_ingredient
    assert test_ingredient.quantity.fraction?
 
    tb = TableCloth::Recipe.new(:ingredients => "1/4 oz sugar")
    test_ingredient = TableCloth::Ingredient.new :qty => "1/4", :unit => :ounce, :item => "sugar"
    assert_equal tb.ingredients.first, test_ingredient
  end

  def test_awkward_syntax_parsing
    tb = TableCloth::Recipe.new(:ingredients => "1 tablespoon of sugar")
    test_ingredient = TableCloth::Ingredient.new :qty => "1", :unit => :tablespoon, :item => "sugar"
    assert_equal tb.ingredients.first, test_ingredient
    assert !test_ingredient.is_free_text?

    tb = TableCloth::Recipe.new(:ingredients => "1 bouquet garni")
    test_ingredient = TableCloth::Ingredient.new :qty => "1", :unit => :na, :item => "bouquet garni"
    assert_equal tb.ingredients.first, test_ingredient

    tb = TableCloth::Recipe.new(:ingredients => "a cup of sugar")
    test_ingredient = TableCloth::Ingredient.new :qty => "1", :unit => :cup, :item => "sugar"
    assert_equal tb.ingredients.first, test_ingredient
    assert !tb.ingredients.first.is_free_text?

    tb = TableCloth::Recipe.new(:ingredients => "salt to taste")
    test_ingredient = TableCloth::Ingredient.new :item => "salt to taste", :qty => :na, :unit => :na
    assert test_ingredient.is_free_text?, "test comparison"    
    assert_equal tb.ingredients.first, test_ingredient

    tb = TableCloth::Recipe.new(:ingredients => "cup of sugar")
    test_ingredient = TableCloth::Ingredient.new :item => "sugar", :qty => 1, :unit => :cup
    assert_equal tb.ingredients.first, test_ingredient
    
  end
end
