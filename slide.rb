# encoding: UTF-8
require 'ext/highlighter'

class Slide
  include HH::Markup

  attr_reader :app

  def initialize(app)
    @app = app
    @effects = effects
    after_initialize
  end

  def content
    # implemented by subclasses
  end

  def show
    stack do
      content
    end
  end

  # copied from the URL implementation... weird but I want to have
  # classes not methods for this
  def method_missing(method, *args, &blk)
    if app_should_handle_method? method
      app.send(method, *args, &blk)
    else
      super
    end
  end

  def code(string)
    para *highlight(string), size: CODE_SIZE
  end

  def demo(file_path)
    source = File.read file_path
    eval source
  end

  def headline(string)
    title '  ' + string, size: HEADLINE_SIZE
    empty_line
  end

  def bullet(string)
    para '  • ' + string, size: BULLET_POINT_SIZE
  end

  def empty_line
    para ' ', size: BULLET_POINT_SIZE
  end

  def fullscreen_image(path)
    img = image path
    height_ratio = height.to_r/img.height
    width_ratio = width.to_r/img.width
    if width_ratio > height_ratio
      scale_image_by img, width_ratio
    else
      scale_image_by img, height_ratio
    end
  end

  def scale_image_by(img, ratio)
    img.width = (img.width * ratio).to_i
    img.height = (img.height * ratio).to_i
  end

  def after_initialize
    # subclasses if an after hook is needed
  end

  # overwrite in subclass to provide effects
  def effects
    []
  end

  def effects_left?
    !@effects.empty?
  end

  def trigger_effect
    effect = @effects.shift
    effect.call
  end

  private
  def app_should_handle_method? method_name
    !self.respond_to?(method_name) && app.respond_to?(method_name)
  end

end