class Title < Slide
  def content
    stack height: height/2 - 250
    para 'Shoes4 - Ruby for GUI', align: 'center', size: VERY_BIG_SIZE
    subtitle 'Tobias Pfeiffer (@PragTob)'
    subtitle 'Blog: pragtob.wordpress.com'
  end

  def subtitle(string)
    para string, align: 'center', size: BULLET_POINT_SIZE
  end
end