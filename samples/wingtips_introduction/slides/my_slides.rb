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

class Images < Wingtips::Slide
  def content
    headline 'Embed images and shoes easily!'

    image 'shoes-icon.png'
    para 'standard shoes methods like para are of course okay as well!'
    subtitle 'Or some drawing'
    rect 300, 400, 200, 300, fill: lime
  end
end

class FullScreenImage < Wingtips::Slide
  def content
    # learning photo - Creative Commons Attribution-ShareAlike 2.0 http://www.flickr.com/photos/83633410@N07/7658165122/in/photostream/
    fullscreen_image 'learning.jpg'
  end
end

class FullyShownImage < Wingtips::Slide
  def content
    # learning photo - Creative Commons Attribution-ShareAlike 2.0 http://www.flickr.com/photos/83633410@N07/7658165122/in/photostream/
    fully_shown_image 'learning.jpg'
  end
end

class Code < Wingtips::Slide
  def content
    subtitle 'Show code from a string...'
    code 'puts "Hello wingtips!"'
    empty_line
    subtitle 'Or a file'
    code 'code/demo_code.rb'
  end
end

class CodeExecute < Wingtips::Slide
  def content
    headline 'Code and execute'

    code 'alert "Surprse!"', true
  end
end