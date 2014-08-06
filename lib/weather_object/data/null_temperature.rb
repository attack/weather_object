module WeatherObject
  module Data
    class NullTemperature < NullConvertableUnits
      def c
        nil
      end

      def f
        nil
      end
    end
  end
end
