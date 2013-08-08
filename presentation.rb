class Presentation < Shoes
  url '/', :start
  url '/slide/(\d+)', :slide

  def start
    slide(1)
  end

  def slide(number)
    para "you are looking at slide number #{number}"
    p number
    button 'next slide' do visit "/slide/#{number.to_i + 1}" end
  end
end

Shoes.app width: 1024, height: 768