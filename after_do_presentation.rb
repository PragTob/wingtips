require_relative 'presentation'

require_relative 'slides/after_do'

NEXT_KEYS = [:right, :page_down]
PREVIOUS_KEYS = [:left, :page_up]

SLIDES = [Slide, SRP, CrosscuttingConcers, AOP, Intro, ADExample, ADThanks]
PHOTO_CREDIT_SIZE = 18
CODE_SIZE = 30
BULLET_POINT_SIZE = 40
HEADLINE_SIZE = 65
VERY_BIG_SIZE = 80
ENORMOUS_SIZE = 140

Presentation.start
