require 'base'

class Image < Base
  attr_accessor :heading,
                :url,
                :display_order

  def initialize(heading, url, display_order = nil, like_number = 0)
    super(like_number)
    @heading       = heading
    @url           = url
    @display_order = display_order
  end
end