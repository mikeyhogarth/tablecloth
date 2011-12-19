#This file contains very generic functionality tests

require "test/unit"
require "tablecloth"

class TestTablecloth < Test::Unit::TestCase

  def test_type
    str = "anything"
    tc = TableCloth::Recipe.new :ingredients => str
    
    #shoudl return an array
    assert_equal Array, tc.ingredients.class
  end

  def test_one_line_recipe
    str = "1 tablespoon salt"
    tc = TableCloth::Recipe.new :ingredients => str

    #should only be one
    assert_equal tc.ingredients.count, 1
  end

  def test_multi_line_recipe
    str = "1 tablespoon salt \n 1/2 cup sugar"
    tc = TableCloth::Recipe.new :ingredients => str

    #should be two
    assert_equal tc.ingredients.count, 2
  end  

  def test_add_ingredient
    ingredient = TableCloth::Ingredient.new :qty => "1", :item => "sugar", :unit => :kg
    assert_equal ingredient.class, TableCloth::Ingredient

    tc = TableCloth::Recipe.new
    tc.ingredients << ingredient
    assert_equal tc.ingredients.first, ingredient
    
  end

  def test_iteration
    tc = TableCloth::Recipe.new(:ingredients => "1 kg sugar \n 2kg carrots")
    assert_equal 2, tc.ingredients.count

    tc.ingredients.each do |ingredient|
      assert ingredient.class == TableCloth::Ingredient
    end    
  end
  
end
