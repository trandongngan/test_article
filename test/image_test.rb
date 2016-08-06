require 'minitest/autorun'
require 'image'

class TestImage < Minitest::Test
  def setup
    @img = Image.new('Heading', '/image/abc.png', 0)
  end

  def test_increase_like_number
    @img.increase_like_number
    assert_equal(1, @img.like_number)
  end

  def test_get_like_number
    @img.increase_like_number
    assert_equal(1, @img.get_like_number)
  end
end
