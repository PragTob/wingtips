require 'wingtips/slide'

module Wingtips
  module Presentation
    NEXT_KEYS = [:right, :page_down]
    PREVIOUS_KEYS = [:left, :page_up]

    def self.start(slides)
      puts "Presenting #{slides.size} slides"

      Shoes.app fullscreen: true, title: 'Presentation' do
        @slides = slides

        def start
          setup_controls
          go_to_slide(0)
        end

        def go_to_slide(number)
          clear
          @current_slide_number = number.to_i
          slide_class = @slides[@current_slide_number]
          @current_slide = slide_class.new(app)
          @current_slide.show
        end

        def next_slide
          if @current_slide_number <= @slides.size - 2
            go_to_slide @current_slide_number + 1
          else
            exit
          end
        end

        def previous_slide
          if @current_slide_number > 0
            go_to_slide @current_slide_number - 1
          end
        end

        def setup_controls
          keypress do |key|
            slide_controls key
            fullscreen_controls key
          end
        end

        def slide_controls(key)
          if NEXT_KEYS.include? key
            if @current_slide.effects_left?
              @current_slide.trigger_effect
            else
              next_slide
            end
          end
          previous_slide if PREVIOUS_KEYS.include? key
        end

        def fullscreen_controls(key)
          toggle_fullscreen if key == :f11 || key == "f"
        end

        def toggle_fullscreen
          self.fullscreen = !fullscreen
        end

        start
      end
    end
  end
end
