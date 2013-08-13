class Title < Slide
  def content
    stack height: height/2 - 250
    centered_title 'Shoes4 - Ruby for GUI'
    centered_subtitle 'Tobias Pfeiffer (@PragTob)'
    centered_subtitle 'Blog: pragtob.wordpress.com'
  end
end

class ShoesOn < Slide
  def content
    stack height: height/2 - 200
    centered_title 'Shoes on!'
    empty_line
    centered_subtitle 'Tobias Pfeiffer (@PragTob)'
  end
end