class HowDoesThisWork < Slide
  def content
    headline 'How does this work?'
    bullet 'see the code of this slide: '
    empty_line
    code File.read __FILE__
  end
end