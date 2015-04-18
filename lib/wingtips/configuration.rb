module Wingtips
  class Configuration
    include DSL

    attr_reader :slide_classes

    def initialize(path)
      self.class.current = self
      @wingtips_options = {
        app: {
          title:      'Presentation',
          fullscreen: true
        }
      }

      full_path = File.expand_path(path)
      load_templates full_path
      load_named_slides full_path

      # the empty slide at the start is needed as otherwise the dimensions
      # of the first slide are most likely messed up
      @slide_classes = [Wingtips::Slide]

      self.instance_eval(File.read(full_path))
    end

    def app_options
      @wingtips_options[:app]
    end

    def template_options
      @wingtips_options[:templates]
    end

    def wingtips_options(opts={})
      HashUtils.deep_merge! @wingtips_options, opts
    end

    def slides(*slide_classes)
      @slide_classes.concat(slide_classes)
    end

    def unnamed_slides_allowed?
      @allow_unnamed_slides
    end

    class << self
      attr_accessor :current
    end

    private
    def load_templates(full_path)
      load_in_dir(full_path, "templates/*.rb")
    end

    def load_named_slides(full_path)
      @allow_unnamed_slides = false
      load_in_dir(full_path, "slides/*.rb")
      @allow_unnamed_slides = true
    end

    def load_in_dir(full_path, pattern)
      dir = File.dirname(full_path)
      Dir[File.join(dir, pattern)].each do |file|
        require file unless file == full_path
      end
    end
  end
end
