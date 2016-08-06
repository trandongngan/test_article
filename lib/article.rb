require 'date'
require 'base'

class Article < Base
  attr_accessor :title,
                :release_datetime

  HAS_NOT_RELEASED_STATUS = 0
  HAS_RELEASED_STATUS     = 1

  def initialize(title, release_datetime = nil, like_number = 0)
    super(like_number)
    @title            = title && title.capitalize!
    @release_datetime = DateTime.parse(release_datetime.to_s)
    @images           = []
    @text             = []
  end

  ##
  # add image into article
  def add_image(image)
    @images.push(image)
  end

  ##
  # add text into article
  def add_text(text)
    @text.push(text)
  end

  ##
  # return array of list image and list text if article is released
  def get_content
    @images.sort! {|a, b| a.display_order <=> b.display_order}
    @text.sort! {|a, b| a.display_order <=> b.display_order}

    is_released? ? [@images, @text] : nil
  end

  ##
  # returns true if release datetime is greater than now
  def is_released?
    @release_datetime.instance_of?(DateTime) && @release_datetime < DateTime.now
  end

  ##
  # get status of article
  def status
    is_released? ? HAS_RELEASED_STATUS : HAS_NOT_RELEASED_STATUS
  end
end
