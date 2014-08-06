module WeatherObject
  module Attribute
    class Distance < Virtus::Attribute
      def coerce(value, *args)
        if value.nil?
          Data::NullDistance.new
        elsif value.is_a? Data::Distance
          value
        else
          Data::Distance.new(*value)
        end
      end
    end
  end
end
