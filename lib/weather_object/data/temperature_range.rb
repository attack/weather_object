module WeatherObject
  module Data
    class TemperatureRange
      def initialize(*args)
        relevant_args = args.take(2).compact
        @range = Range.new(relevant_args.first, relevant_args.last)
      end

      def low
        range.min
      end

      def high
        range.max
      end

      def cover?(value)
        range.cover?(value)
      end

      def to_s
        if low == high
          low.to_s
        else
          range.to_s
        end
      end

      private

      attr_reader :range
    end
  end
end
