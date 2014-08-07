module WeatherObject
  module Data
    class NullRate < NullConvertableUnits
      def mm_per_hour
        nil
      end

      def in_per_hour
        nil
      end
    end
  end
end
