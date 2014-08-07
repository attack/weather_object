module WeatherObject
  module Attribute
    class Location < Virtus::Attribute
      def coerce(value, *args)
        if value.nil?
          Data::NullLocation.new
        elsif value.is_a? Data::Location
          value
        else
          Data::Location.new(value)
        end
      end
    end
  end
end
