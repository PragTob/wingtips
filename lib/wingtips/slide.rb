# encoding: UTF-8

module Wingtips
  PHOTO_CREDIT_SIZE = 18
  CODE_SIZE = 30
  BULLET_POINT_SIZE = 40
  HEADLINE_SIZE = 65
  VERY_BIG_SIZE = 80
  ENORMOUS_SIZE = 140

  class Slide
    include Shoes::Highlighter::Markup

    IMAGES_DIRECTORY  = 'images/'
    CODE_DIRECTORY    = 'code/'

    attr_reader :app

    def initialize(app, slide_options = {})
      @app = app
      @effects = []
      @background_color = slide_options[:background_color]
      @code_highlighting = Shoes::Highlighter::Markup::COLORS
      if slide_options[:code_highlighting]
        @code_highlighting = @code_highlighting.merge slide_options[:code_highlighting]
      end
      after_initialize
    end

    def content
      # implemented by subclasses
    end

    def show
      @main_slot = stack height: app.height do
        background @background_color if @background_color
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
      highlighted_code = para *highlight(source, nil, @code_highlighting), size: CODE_SIZE
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
      img
    end

    def centered_title(string, opts={})
      para string, defaulted_options(opts,
                                     align: 'center',
                                     size: VERY_BIG_SIZE,
                                     margin_top: 50)
    end

    def centered_subtitle(string, opts={})
      para string, defaulted_options(opts,
                                     align: 'center',
                                     size: BULLET_POINT_SIZE,
                                     margin_top: 50)
    end

    def centered_huge_text(string, opts={})
      para string, defaulted_options(opts,
                                     align: 'center',
                                     size: VERY_BIG_SIZE,
                                     margin_top: 50)
    end

    def centered_enormous_text(string, opts={})
      para string, defaulted_options(opts,
                                     align: 'center',
                                     size: ENORMOUS_SIZE,
                                     margin_top: 50)
    end

    def center_horizontally(element)
      element.left = @app.width / 2 - element.width / 2
    end

    def defaulted_options(passed, defaults={})
      results = defaults.merge(passed)
      if results[:vertical_align] == 'center'
        results[:margin_top] = height/2 - 100
      end
      results
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
