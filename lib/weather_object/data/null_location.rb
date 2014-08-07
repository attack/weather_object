module WeatherObject
  module Data
    class NullLocation < NullValue
      def id
        ''
      end

      def latitude
        nil
      end

      def longitude
        nil
      end

      def coordinates
        ''
      end

      def name
        ''
      end

      def city
        ''
      end

      def state_name
        ''
      end

      def country
        ''
      end

      def country_code
        ''
      end

      def zip_code
        ''
      end
    end
  end
end
