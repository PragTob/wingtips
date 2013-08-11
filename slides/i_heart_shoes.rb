# encoding: UTF-8

class IHeartShoes < Slide
  def content
    5.times do empty_line end
    para 'I ', fg('♥', red), ' Shoes', size: ENORMOUS_SIZE, align: 'center'
  end
end