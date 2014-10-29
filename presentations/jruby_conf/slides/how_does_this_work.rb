class HowDoesThisWork < Wingtips::Slide
  def content
    headline 'How does this work?'
    bullet 'see the code of this Wingtips::Slide: '
    empty_line
    code __FILE__
  end
end