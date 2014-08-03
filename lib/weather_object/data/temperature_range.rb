require 'delegate'

module WeatherObject
  module Data
    class TemperatureRange < SimpleDelegator
      def initialize(*args)
        relevant_args = args.take(2).compact
        range = Range.new(relevant_args.first, relevant_args.last)
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
    end
  end
end
