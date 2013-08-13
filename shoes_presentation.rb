require_relative 'presentation'

Dir.glob('slides/*').each do |slide_file|
  require_relative slide_file
end

NEXT_KEYS = [:right]
PREVIOUS_KEYS = [:left]

SLIDES = [Slide, Squeak, Keynote, Libreoffice, IHeartShoes, General, Shoes4, PluggableBackend, Samples, BasicApp, HowDoesThisWork, MissingBeforeAlpha, BeforeRelease, LeftOut, AwesomeFinish, PhotoCredit]
CODE_SIZE = 30
BULLET_POINT_SIZE = 40
HEADLINE_SIZE = 65
ENORMOUS_SIZE = 140


Presentation.start
