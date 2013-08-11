require_relative 'slide'
Dir.glob('slides/*').each do |slide_file|
  require_relative slide_file
end
SLIDES = [SqueakSlide, CodeSlide, Outlook, PhotoCredit]
CODE_SIZE = 30
BULLET_POINT_SIZE = 40

require_relative 'presentation'
