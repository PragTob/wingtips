require_relative 'slide'
Dir.glob('slides/*').each do |slide_file|
  require_relative slide_file
end
SLIDES = [Slide1, ImageSlide, Slide2, CodeSlide]

require_relative 'presentation'
