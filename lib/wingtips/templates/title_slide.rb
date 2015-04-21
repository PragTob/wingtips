module Wingtips
  module Templates
    module TitleSlide
      DEFAULT_TITLE_SLIDE_OPTIONS = {
        size:           Wingtips::ENORMOUS_SIZE,
        vertical_align: 'center',
        weight:         'bold'
      }.freeze

      def title_slide(name, text, opts={}, &block)
        options = merge_template_options DEFAULT_TITLE_SLIDE_OPTIONS,
          :title_slide,
          opts

        slide(name) do
          background options[:background] if options[:background]
          centered_title text, options
          self.instance_eval(&block) if block
        end
      end
    end
  end
end
