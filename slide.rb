# encoding: UTF-8
require 'ext/highlighter'

class Slide
  include HH::Markup

  attr_reader :app

  def initialize(app)
    @app = app
    @effects = []
    after_initialize
  end

  def content
    # implemented by subclasses
  end

  def show
    @main_slot = stack do
      content
    end
  end

  def append(&blk)
    @main_slot.append &blk
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

  def code(string, demo_as_effect = false)
    source = source_from string
    source = source.split("\n").map{|line| '     ' + line}.join("\n")
    para *highlight(source), size: CODE_SIZE
    add_demo_as_effect(source) if demo_as_effect
  end

  def demo(string)
    source = source_from string
    eval source
  end

  def source_from(string)
    if is_file_path? string
      File.read string
    else
      string
    end
  end

  def is_file_path?(file_path)
    File.exist? file_path
  end

  def add_demo_as_effect(string)
    add_effect do demo(string) end
  end

  def add_effect(&effect)
    @effects << effect
  end

  def headline(string)
    text = title '  ' + string, size: HEADLINE_SIZE
    empty_line
    text
  end

  def bullet(string)
    para '    • ' + string, size: BULLET_POINT_SIZE
  end

  def empty_line
    para ' ', size: BULLET_POINT_SIZE
  end

  def fullscreen_image(path)
    img = image path
    height_ratio = height.to_r/img.height
    width_ratio = width.to_r/img.width
      scale_image_by img, [width_ratio, height_ratio].max
    img
  end

  def fully_shown_image(path, additional_height = 0)
    img = image path
    height_ratio = (height - additional_height).to_r/img.height
    width_ratio = width.to_r/img.width
    scale_image_by img, [width_ratio, height_ratio].min
    img
  end

  def scale_image_by(img, ratio)
    img.width = (img.width * ratio).to_i
    img.height = (img.height * ratio).to_i
  end

  def centered_title(string)
    para string, align: 'center', size: VERY_BIG_SIZE
  end

  def centered_subtitle(string)
    para string, align: 'center', size: BULLET_POINT_SIZE
  end

  def after_initialize
    # subclasses if an after hook is needed
  end

  def effects_left?
    !@effects.empty?
  end

  def trigger_effect
    effect = @effects.shift
    @main_slot.append &effect
  end

  def centered_huge_text(string)
    stack height: height/2 - 100
    para string, align: 'center', size: VERY_BIG_SIZE
  end

  private
  def app_should_handle_method? method_name
    !self.respond_to?(method_name) && app.respond_to?(method_name)
  end

end