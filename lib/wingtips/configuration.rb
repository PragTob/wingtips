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
        },
        templates: {}
      }


      full_path = File.expand_path(path)
      load_options(full_path)
      load_templates full_path
      load_named_slides full_path

      # the empty slide at the start is needed as otherwise the dimensions
      # of the first slide are most likely messed up
      @slide_classes = [Wingtips::Slide]

      self.instance_eval(File.read(full_path))
    end

    def load_options(full_path)
      begin
        @allow_unnamed_slides = true
        self.instance_eval(File.read(full_path))
      rescue NameError
        @allow_unnamed_slides = false
        # expected to hit the first slide class and then abort evaling
        # the config file. This is necessary so we can have the options at the
        # beginning of the config file while they are needed in the tamplates
        # for instance. So what happens is:
        # 1. read config (options should be on top)
        # 2. error upon encountering the first class, continue in initialize
        # 3. Load slides and templates (while options are already loaded)
        # 4. eval the config file again (options are read again, shouldn't be
        #   a problem). This time no error as slide and template classes are
        #   loaded
        # Yes there could be a separate options file, but it didn't feel right
        # to have a config and an options file
      end
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
