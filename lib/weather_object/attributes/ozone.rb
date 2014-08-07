module WeatherObject
  module Attribute
    class Ozone < Virtus::Attribute
      def coerce(value, *args)
        if value.nil?
          Data::NullOzone.new
        elsif value.is_a? Data::Ozone
          value
        else
          Data::Ozone.new(value)
        end
      end
    end
  end
end
