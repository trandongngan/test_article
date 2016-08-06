require 'minitest/autorun'
require 'text'

class TestText < Minitest::Test
  def setup
    @text = Text.new('Heading', 'Content article', 0)
  end

  def test_increase_like_number
    @text.increase_like_number
    assert_equal(1, @text.like_number)
  end

  def test_get_like_number
    assert_equal(0, @text.get_like_number)
  end
end
