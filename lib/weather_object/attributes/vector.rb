module WeatherObject
  module Attribute
    class Vector < Virtus::Attribute
      def coerce(value, *args)
        if value.nil?
          Data::NullVector.new
        elsif value.is_a? Data::Vector
          value
        else
          Data::Vector.new(*value)
        end
      end
    end
  end
end
