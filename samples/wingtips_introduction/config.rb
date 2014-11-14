# Arrange the order of your slides here
slides Hello, Bullets, DSLSlide, Images, FullScreenImage, FullyShownImage, Code,
       CodeExecute, HowDoesThisWork
       
slide do
  headline 'Fancy DSLs can even be unnamed'
end

code = <<-CODE
class MyClass
  def fancy_method
    magic!
  end
end
CODE

code_slide 'Template methods', code
