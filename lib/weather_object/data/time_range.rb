require 'delegate'

module WeatherObject
  module Data
    class TimeRange < SimpleDelegator
      def initialize(*args)
        range = Range.new(*args)
        super(range)
      end

      def starts_at
        min
      end

      def ends_at
        max
      end

      def size
        max - min
      end
    end
  end
end
