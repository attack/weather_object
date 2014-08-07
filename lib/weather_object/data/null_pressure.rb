module WeatherObject
  module Data
    class NullPressure < NullConvertableUnits
      def mb
        nil
      end

      def in
        nil
      end
    end
  end
end
