module WeatherObject
  module Data
    class NullConvertableUnits < NullValue
      def metric
        nil
      end

      def imperial
        nil
      end

      def units
        ''
      end
    end
  end
end
