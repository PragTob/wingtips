class Title < Wingtips::Slide
  def content
    stack height: height/2 - 250
    centered_title 'Shoes4 - Ruby for GUI'
    centered_subtitle 'Tobias Pfeiffer (@PragTob)'
    centered_subtitle 'pragtob.info'
  end
end

class ShoesOn < Wingtips::Slide
  def content
    stack height: height/2 - 200
    centered_title 'Shoes on!'
    empty_line
    centered_subtitle 'Tobias Pfeiffer (@PragTob)'
  end
end