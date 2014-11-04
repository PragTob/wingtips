# encoding: UTF-8
require 'ext/highlighter'

module Wingtips
  class Slide
    include HH::Markup

    PHOTO_CREDIT_SIZE = 18
    CODE_SIZE         = 30
    BULLET_POINT_SIZE = 40
    HEADLINE_SIZE     = 65
    VERY_BIG_SIZE     = 80
    ENORMOUS_SIZE     = 140
    IMAGES_DIRECTORY  = 'images/'
    CODE_DIRECTORY    = 'code/'

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
      @main_slot = stack height: app.height do
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

    def code(string, demo_as_effect = false, &block)
      source = source_from string
      source = source.split("\n").map{|line| '     ' + line}.join("\n")
      highlighted_code = para *highlight(source), size: CODE_SIZE
      add_demo_as_effect(source, &block) if demo_as_effect
      highlighted_code
    end

    def demo(string, &block)
      source = source_from string
      eval source

      last_app = Shoes.apps.last
      last_app.keypress do |key|
        last_app.quit if key == :control_w
      end

      yield last_app if block_given?
    end

    def source_from(string)
      file_path = find_file_in(string, [CODE_DIRECTORY])

      if file_path
        File.read file_path
      else
        string
      end
    end

    def add_demo_as_effect(string, &block)
      add_effect do demo(string, &block) end
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

    def image(path, *args)
      app.image(image_path(path), *args)
    end

    def image_path(path)
      path = find_file_in(path, [IMAGES_DIRECTORY])
      File.expand_path(path)
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
    def find_file_in(file_path, locations)
      candidate_locations = locations.map {|location| location + file_path}
      candidate_locations << file_path
      candidate_locations.find do |candidate_path|
        is_file_path? candidate_path
      end
    end

    def is_file_path?(file_path)
      File.exist? file_path
    end

    def app_should_handle_method? method_name
      !self.respond_to?(method_name) && app.respond_to?(method_name)
    end

  end
end
