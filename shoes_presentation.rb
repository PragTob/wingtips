require_relative 'slide'
Dir.glob('slides/*').each do |slide_file|
  require_relative slide_file
end
SLIDES = [Slide, SqueakSlide, IHeartShoes, General, MetaSlide, MissingBeforeAlpha, Outlook, PhotoCredit]
CODE_SIZE = 30
BULLET_POINT_SIZE = 40
HEADLINE_SIZE = 65
ENORMOUS_SIZE = 140

require_relative 'presentation'
