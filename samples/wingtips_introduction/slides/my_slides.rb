# You can write multiple files with slides or just put them all in one file

class Hello < Wingtips::Slide
  def content
    centered_huge_text 'Welcome to Wingtips!'
  end
end

class Bullets < Wingtips::Slide
  def content
    headline 'Use bullet points, would you?'

    bullet "It's easy isn't it?"
    bullet 'Just keep on'
    bullet 'with ease!'
  end
end