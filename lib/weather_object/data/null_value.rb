module WeatherObject
  module Data
    class NullValue
      include Comparable

      def nil?
        true
      end

      def to_i
        nil
      end

      def to_f
        nil
      end

      def to_s
        ''
      end

      def <=>(other)
        self.class <=> other.class
      end
    end
  end
end
