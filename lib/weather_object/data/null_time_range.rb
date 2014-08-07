module WeatherObject
  module Data
    class NullTimeRange < NullValue
      def starts_at
        nil
      end

      def ends_at
        nil
      end

      def size
        0
      end

      def covers?(_)
        false
      end
    end
  end
end
