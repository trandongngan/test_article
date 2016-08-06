require 'minitest/autorun'
require 'article'
require 'image'
require 'text'

class TestArticle < Minitest::Test
  def setup
    $yesterday = Time.now - 24*60*60;
    @article   = Article.new('Title', $yesterday)
  end

  def test_increase_like_number
    @article.increase_like_number
    assert_equal(1, @article.like_number)
  end

  def test_get_like_number
    assert_equal(0, @article.get_like_number)
  end

  def test_is_released_true
    assert_equal(true, @article.is_released?)
  end

  def test_is_released_false
    $tomorrow = Time.now + 24*60*60;
    @article.instance_variable_set(:@release_datetime, $tomorrow)
    assert_equal(false, @article.is_released?)
  end

  def test_status_released
    assert_equal(1, @article.status)
  end

  def test_status_has_not_released
    $tomorrow = Time.now + 24*60*60;
    @article.instance_variable_set(:@release_datetime, $tomorrow)
    assert_equal(0, @article.status)
  end

  def test_get_content_nil
    $tomorrow = Time.now + 24*60*60;
    @article.instance_variable_set(:@release_datetime, $tomorrow)

    assert_nil(@article.get_content)
  end

  def test_get_content
    (1..10).each do |i|
      order = (10 - i) + 1

      image = Image.new("Image #{i}", "/images/#{i}.png", order);
      @article.add_image(image)

      text  = Text.new("Text #{i}", "Text content #{i}", order);
      @article.add_text(text)
    end

    content = @article.get_content
    images  = content[0]
    text    = content[1]

    # confirm
    assert_equal(10, images.count, "Total image")
    assert_equal(10, text.count, "Total text")

    i = 1
    images.each do |image|
      assert_equal(i, image.display_order, "Display order of image_#{i}")
      assert_equal(0, image.get_like_number, "Like number of image_#{i}")
      i += 1
    end

    i = 1
    text.each do |item|
      assert_equal(i, item.display_order, "Display order of text_#{i}")
      assert_equal(0, item.get_like_number, "Like number of text_#{i}")
      i += 1
    end
  end
end
