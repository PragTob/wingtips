class MoreSamples < Slide
  def content
    headline 'More Samples'
    image_appear 'images/infoes.png'
    image_appear 'images/gsWax.png'
    image_appear 'images/pomodoro_tracker.png'
    image_appear 'images/HacketyHack.png'
  end

  private
  def image_appear(path)
    add_effect do
      @image.remove if @image
      @image = image path
    end
  end
end
