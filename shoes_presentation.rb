require_relative 'slide'
Dir.glob('slides/*').each do |slide_file|
  require_relative slide_file
end
SLIDES = [SqueakSlide, CodeSlide, PhotoCredit]

require_relative 'presentation'
