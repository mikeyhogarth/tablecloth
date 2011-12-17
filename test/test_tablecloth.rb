require "test/unit"
require "tablecloth"

class TestTablecloth < Test::Unit::TestCase

  def test_type
    str = "anything"
    tc = TableCloth.new str
    
    #shoudl return an array
    assert_equal Array, tc.ingredients.class
  end

  def test_one_line_recipe
    str = "1 tablespoon salt"
    tc = TableCloth.new str

    #should only be one
    assert_equal tc.ingredients.count, 1
  end

  def test_multi_line_recipe
    str = "1 tablespoon salt \n 1/2 cup sugar"
    tc = TableCloth.new str

    #should be two
    assert_equal tc.ingredients.count, 2
  end  
end
