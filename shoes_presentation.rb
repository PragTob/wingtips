require_relative 'presentation'

Dir.glob('slides/*').each do |slide_file|
  require_relative slide_file
end

NEXT_KEYS = [:right, :page_down]
PREVIOUS_KEYS = [:left, :page_up]

SLIDES = [Slide, PluggableBackend, Squeak, Keynote, PowerPoint, Libreoffice, IHeartShoes, Title, General, Shoes4, PluggableBackend, Samples, MoreSamples, BasicApp, HowDoesThisWork, MissingBeforeAlpha, BeforeRelease, LeftOut, WhyCare, Web, Console, Learn, Tool, GradeClass, Fun, IHeartShoes, ShoesOn, PhotoCredit]
CODE_SIZE = 30
BULLET_POINT_SIZE = 40
HEADLINE_SIZE = 65
VERY_BIG_SIZE = 80
ENORMOUS_SIZE = 140

Presentation.start
