module Wingtips
  class Configuration
    attr_reader :slide_classes

    def initialize(path)
      full_path = File.expand_path(path)
      load_named_slides full_path

      # the empty slide at the start is needed as otherwise the dimensions
      # of the first slide are most likely messed up
      @slide_classes = [Wingtips::Slide]

      self.instance_eval(File.read(full_path))
    end

    def slide(title=nil, &content)
      clazz = create_slide_class content
      publish_slide_class clazz, title
    end

    def slides(*slide_classes)
      @slide_classes.concat(slide_classes)
    end

    private
    def load_named_slides(full_path)
      @allow_unnamed_slides = false
      dir = File.dirname(full_path)
      Dir[File.join(dir, "slides/*.rb")].each do |file|
        self.instance_eval(File.read(file)) unless file == full_path
      end
      @allow_unnamed_slides = true
    end

    def create_slide_class(content)
      clazz = Class.new(Wingtips::Slide)
      clazz.class_eval do
        define_method(:content, &content)
      end
      clazz
    end

    def publish_slide_class(clazz, title)
      if @allow_unnamed_slides && title.nil?
        @slide_classes << clazz
      elsif title.nil?
        raise "Unnamed calls to `slide do` aren't allowed in the slides subdirectory.\n" \
              "Try `slide \"MySlide\" do` so you can reference it in config."
      else
        Object.const_set(title, clazz)
      end
    end
  end
end
