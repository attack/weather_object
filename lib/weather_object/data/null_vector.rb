module WeatherObject
  module Data
    class NullVector < NullConvertableUnits
      def kph
        nil
      end

      def mph
        nil
      end

      def bearing
        nil
      end
    end
  end
end
