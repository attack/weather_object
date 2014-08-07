module WeatherObject
  module Data
    class NullOzone < NullValue
      def du
        nil
      end

      def units
        ''
      end
    end
  end
end
