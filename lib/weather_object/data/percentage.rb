module WeatherObject
  module Data
    class Percentage
      def initialize(input)
        @value = PercentageInput.new(input).parse
      end

      def to_i
        value.to_i
      end

      def to_f
        value.to_f
      end

      def to_s
        sprintf "%.1f \%", (to_f * 100)
      end

      private

      attr_reader :value

      class PercentageInput
        def initialize(input)
          @input = input
        end

        def parse
          convert!
          cap_significant_digits!
        end

        private

        attr_reader :input

        def out_of_one_hundred?
          input.to_f > 1.0 || input.to_s.match(/\%/)
        end

        def input_converted
          input.to_f / 100.0
        end

        def convert!
          if out_of_one_hundred?
            @input = input_converted
          else
            @input = input.to_f
          end
        end

        def cap_significant_digits!
          @input = input.round(4)
        end
      end
    end
  end
end
