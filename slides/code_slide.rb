class CodeSlide < Slide
  def content
    text = <<eos
Shoes.app do button 'hello' end
puts 'yolooo'
timer 2
eos
    code text
  end
end