module WeatherObject
  module Data
    class NullDistance < NullConvertableUnits
      def km
        nil
      end

      def m
        nil
      end
    end
  end
end
