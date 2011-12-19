require "test/unit"
require "tablecloth"

class TestHtml < Test::Unit::TestCase
  
  def test_ingredients_html_generation
    
    tb = TableCloth::Recipe.new

    assert_equal "", tb.ingredients_to_html
    
    tb.parse_ingredients "1 cup of sugar"
    
    html = tb.ingredients_to_html
    assert_equal(html, "<ul><li>1 cup of sugar</li></ul>")

    html = tb.ingredients_to_html :class => "mikey"
    assert_equal(html, "<ul class = 'mikey'><li>1 cup of sugar</li></ul>")

    html = tb.ingredients_to_html :id => "mikey"
    assert_equal(html, "<ul id = 'mikey'><li>1 cup of sugar</li></ul>")


    html = tb.ingredients_to_html :id => "mikey", :class => "hogarth"
    assert_equal(html, "<ul id = 'mikey' class = 'hogarth'><li>1 cup of sugar</li></ul>")


  end

end
