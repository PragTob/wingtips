module Wingtips
  module DSL
    def slide(title=nil, &content)
      clazz = create_slide_class content
      publish_slide_class clazz, title
    end
    
    private

    def create_slide_class(content)
      clazz = Class.new(Wingtips::Slide)
      clazz.class_eval do
        define_method(:content, &content)
      end
      clazz
    end

    def publish_slide_class(clazz, title)
      if unnamed_slides_allowed? && title.nil?
        @slide_classes << clazz
      elsif title.nil?
        raise "Unnamed calls to `slide do` aren't allowed in the slides subdirectory.\n" \
              "Try `slide \"MySlide\" do` so you can reference it in config."
      else
        Object.const_set(title, clazz)
      end
    end

    def configuration
      Wingtips::Configuration.current
    end

    def unnamed_slides_allowed?
      configuration.unnamed_slides_allowed?    
    end
  end
end


# extending the main object (doesn't touch the Object class)
extend Wingtips::DSL
