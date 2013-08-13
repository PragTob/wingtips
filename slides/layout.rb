class Layout < Slide
  def content
    headline 'Layout'
    bullet 'not so much juggling of x and y'
    bullet 'Flows & Stacks'
  end
end

OFFSET_FOR_EMPTY_LINE = 60

class Flows < Slide
  def content
    head = headline 'Flows'
    @image = fully_shown_image 'images/flow.png', head.height + OFFSET_FOR_EMPTY_LINE
    add_effect do
      @image.remove
      code 'code/flow.rb', true
    end
  end
end

class Stacks < Slide
  def content
    head = headline 'Stacks'
    @image = fully_shown_image 'images/stack.png', head.height + OFFSET_FOR_EMPTY_LINE
    add_effect do
      @image.remove
      code 'code/stack.rb', true
    end
  end
end