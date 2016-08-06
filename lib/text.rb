require 'base'

class Text < Base
  attr_accessor :heading,
                :sentence,
                :display_order

  def initialize(heading, sentence, display_order = nil, like_number = 0)
    super(like_number)
    @heading       = heading
    @sentence      = sentence
    @display_order = display_order
  end
end