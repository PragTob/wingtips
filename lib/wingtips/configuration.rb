module Wingtips
  class Configuration
    attr_reader :slide_classes

    def initialize(path)
      path = File.expand_path(path)
      dir  = File.dirname(path)
      Dir[File.join(dir, "slides/*.rb")].each do |file|
        self.instance_eval(File.read(file)) unless file == path
      end

      # the empty slide at the start is needed as otherwise the dimensions
      # of the first slide are most likely messed up
      @slide_classes = [Wingtips::Slide]

      self.instance_eval(File.read(path))
    end

    def slide(title=nil, &content)
      clazz = Class.new(Wingtips::Slide)
      clazz.class_eval do
        define_method(:content, &content)
      end

      if title.nil?
        @slide_classes << clazz
      else
        Object.const_set(title, clazz)
      end
    end

    def slides(*slide_classes)
      @slide_classes.concat(slide_classes)
    end
  end
end
