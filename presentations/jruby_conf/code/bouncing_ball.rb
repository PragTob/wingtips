Shoes.app title: 'bouncing ball' do
  strokewidth 5
  circle = oval 40, 40, 100
  SPEED = 10
  xspeed = SPEED
  yspeed = SPEED
  animate 30 do
    xspeed *= -1 if circle.right >= width || circle.left <= 0
    yspeed *= -1 if circle.top <= 0 || circle.bottom >= height
    circle.move circle.left + xspeed, circle.top + yspeed
  end
  click do
    circle.fill = rgb rand(255), rand(255), rand(255)
  end
end