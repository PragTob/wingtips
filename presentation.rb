Shoes.app fullscreen: true, title: 'Presentation' do
  NEXT_KEYS = [:right]
  PREVIOUS_KEYS = [:left]

  def start
    setup_controls
    go_to_slide(0)
  end

  def go_to_slide(number)
    clear
    @current_slide_number = number.to_i
    slide_class = SLIDES[@current_slide_number]
    slide = slide_class.new(app)
    slide.content
  end

  def next_slide
    if @current_slide_number <= SLIDES.size - 2
      go_to_slide @current_slide_number + 1
    else
      exit
    end
  end

  def previous_slide
    if @current_slide_number > 0
      go_to_slide @current_slide_number - 1
    end
  end

  def setup_controls
    keypress do |key|
      slide_controls key
      fullscreen_controls key
    end
  end

  def slide_controls(key)
    if NEXT_KEYS.include? key
      #if @current_slide.effects_left?
      #  @current_slide.trigger_effect
      #else
      next_slide
      #end
    end
    previous_slide if PREVIOUS_KEYS.include? key
  end

  def fullscreen_controls(key)
    toggle_fullscreen if key == :f11
  end

  def toggle_fullscreen
    self.fullscreen = !fullscreen
  end

  start
end