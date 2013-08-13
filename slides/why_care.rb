class WhyCare < Slide
  def content
    stack height: buffer_height
    para 'Why should I care?', align: 'center', size: VERY_BIG_SIZE
  end

  def buffer_height
    height/2 - 100
  end
end