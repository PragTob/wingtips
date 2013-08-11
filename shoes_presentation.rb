require_relative 'slide'
Dir.glob('slides/*').each do |slide_file|
  require_relative slide_file
end
SLIDES = [Slide1, Slide2]

require_relative 'presentation'
