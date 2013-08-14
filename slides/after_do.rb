class SRP < Slide
  def content
    centered_huge_text 'Single Responsibility Principle'
  end
end

class CrosscuttingConcers < Slide
  def content
    headline 'Crosscutting Concerns'
    bullet 'separate concerns'
    bullet 'logging'
    bullet 'metrics'
    bullet 'redrawing'
    bullet '...'
  end
end

class AOP < Slide
  def content
    centered_huge_text 'Aspect Oriented Programming'
  end
end

class Intro < Slide
  def content
    headline 'AfterDo introduction'
    code 'MyClass.after :method do something end'
  end
end

class ADExample < Slide
  def content
    headline 'A little example'
    code 'code/after_do_dog.rb'
  end
end

class Redraws < Slide
  def content
    headline 'Shoes Redraws'
    code 'code/shows_redraws.rb'
  end
end

class ADThanks < Slide
  def content
    stack height: height/2 - 200
    centered_title 'Thank you!'
    empty_line
    centered_subtitle 'Tobias Pfeiffer (@PragTob)'
  end
end