class Base
  attr_accessor :like_number

  def initialize(like_number)
    @like_number = like_number
  end

  ##
  # get like number
  def get_like_number
    @like_number
  end

  ##
  # increase like number
  def increase_like_number
    @like_number += 1
  end
end
