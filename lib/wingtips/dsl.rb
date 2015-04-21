module Wingtips
  module DSL
    def slide(title=nil, &content)
      clazz = create_slide_class content
      publish_slide_class clazz, title
    end

    include Wingtips::Templates::TitleSlide

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

    # merge order is = defaults, template, custom
    def merge_template_options(default_options, template_key, custom_options = {})
      template_options = configuration.template_options.fetch template_key, {}
      options = Wingtips::HashUtils.deep_merge(default_options, template_options)
      Wingtips::HashUtils.deep_merge(options, custom_options)
    end
  end
end


# extending the main object (doesn't touch the Object class)
extend Wingtips::DSL
