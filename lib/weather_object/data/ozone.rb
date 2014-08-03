require 'delegate'

module WeatherObject
  module Data
    class Ozone < SimpleDelegator
      def initialize(magnitude)
        super(magnitude)
      end

      def units
        'DU'
      end

      def du
        to_f
      end

      def to_s
        "#{super} #{units}"
      end
    end
  end
end
