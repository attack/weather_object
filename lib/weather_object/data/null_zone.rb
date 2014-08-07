module WeatherObject
  module Data
    class NullZone < NullValue
      def code
        ''
      end

      def offset
        nil
      end

      def now
        nil
      end
    end
  end
end
