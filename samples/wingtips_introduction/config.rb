# Arrange the order of your slides here
slide_options background_color: Shoes::COLORS[:white],
              code_highlighting: {
                  comment:   { stroke: "#887" },
                  keyword:   { stroke: Shoes::COLORS[:navy], weight: 'bold' },
                  method:    { stroke: Shoes::COLORS[:black], weight: 'bold' },
                  symbol:    { stroke: Shoes::COLORS[:darkviolet], weight: 'bold' },
                  string:    { stroke: Shoes::COLORS[:forestgreen], weight: 'bold' },
                  number:    { stroke: Shoes::COLORS[:steelblue], weight: 'bold' },
                  regex:     { stroke: "#000", fill: "#FFC" },
                  attribute: { stroke: Shoes::COLORS[:darkviolet], weight: 'bold' },
                  expr:      { stroke: "#722", weight: 'bold' },
                  ident:     { stroke: "#994c99", weight: 'bold' },
                  constant:  { stroke: Shoes::COLORS[:darkviolet], weight: "bold" },
                  class:     { stroke: Shoes::COLORS[:darkviolet], weight: "bold" },
                  matching:  { stroke: "#ff0", weight: "bold" },
              }



code = <<-CODE
class MyClass
  def fancy_method
    magic!
    5 + 5
    :symbol
    COLOR
    OtherClass
    @conference
  end
end
CODE

code_slide 'Template methods', code

@conference

code_slide 'Template methods', code

slides Hello, Bullets, DSLSlide, Images, FullScreenImage, FullyShownImage, Code,
       CodeExecute, HowDoesThisWork
       
slide do
  headline 'Fancy DSLs can even be unnamed'
end

code = <<-CODE
class MyClass
  def fancy_method
    magic!
    5 + 5
    :symbol
    COLOR
    OtherClass
    @conference
  end
end
CODE

code_slide 'Template methods', code
