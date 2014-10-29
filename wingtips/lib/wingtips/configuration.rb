module Wingtips
  class Configuration
    attr_reader :slide_classes

    def initialize(path)
      path = File.expand_path(path)
      dir  = File.dirname(path)
      Dir[File.join(dir, "slides/*.rb")].each do |file|
        require file unless file == path
      end

      self.instance_eval(File.read(path))
    end

    def slides(*slide_classes)
      @slide_classes = [Wingtips::Slide] + slide_classes
    end
  end
end
