module WeatherObject
  module Data
    class TimeRange
      def initialize(*args)
        @range = Range.new(*args)
      end

      def starts_at
        range.min
      end

      def ends_at
        range.max
      end

      def cover?(value)
        range.cover?(value)
      end

      def to_s
        range.to_s
      end

      private

      attr_reader :range
    end
  end
end
