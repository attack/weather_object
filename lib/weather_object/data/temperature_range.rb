require 'delegate'

module WeatherObject
  module Data
    class TemperatureRange < SimpleDelegator
      def initialize(*args)
        range = TemperatureRangeInput.new(args).parse
        super(range)
      end

      def low
        min
      end

      def high
        max
      end

      def to_s
        if low == high
          low.to_s
        else
          super
        end
      end

      class TemperatureRangeInput
        def initialize(args)
          @args = args
        end

        def parse
          Range.new(relevant_args.first, relevant_args.last)
        end

        private

        attr_reader :args

        def relevant_args
          args.take(2).compact
        end
      end
    end
  end
end
