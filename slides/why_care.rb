class WhyCare < Slide
  def content
    stack height: buffer_height
    para 'Why should I care?', align: 'center', size: 80
  end

  def buffer_height
    height/2 - 100
  end
end