require "test/unit"
require "tablecloth"

class TestHtml < Test::Unit::TestCase
  
  def test_html_generation
    
    tb = TableCloth.new ("1 cup of sugar")
    assert_raise(NotImplementedError) { tb.to_html }

  end

end
