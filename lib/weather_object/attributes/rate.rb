module WeatherObject
  module Attribute
    class Rate < Virtus::Attribute
      def coerce(value, *args)
        if value.nil?
          Data::NullRate.new
        elsif value.is_a?(Data::Rate)
          value
        else
          Data::Rate.new(*value)
        end
      end
    end
  end
end
