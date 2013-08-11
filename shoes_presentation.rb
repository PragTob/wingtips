require_relative 'slide'
Dir.glob('slides/*').each do |slide_file|
  require_relative slide_file
end
SLIDES = [Slide, SqueakSlide, CodeSlide, MetaSlide, MissingBeforeAlpha, Outlook, PhotoCredit]
CODE_SIZE = 30
BULLET_POINT_SIZE = 40
HEADLINE_SIZE = 65

require_relative 'presentation'
