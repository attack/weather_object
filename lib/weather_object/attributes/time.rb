require 'date'

module WeatherObject
  module Attribute
    class Time < Virtus::Attribute
      def coerce(value)
        value.nil? || value.is_a?(::Time) ? value : parse(*value)
      end

      private

      def parse(*args)
        return unless args.compact.size > 0
        first_arg = args.first

        if first_arg.is_a? ::Time
          first_arg
        elsif first_arg.is_a?(::DateTime) || first_arg.is_a?(::Date)
          ::Time.parse(first_arg.to_s)
        elsif args.size == 1 || args.size == 2
          strptime(*args)
        else
          ::Time.utc(*args)
        end
      end

      def strptime(str, format=nil)
        dt = if format
          ::DateTime.strptime(str, format)
        else
          ::DateTime.parse(str)
        end
        ::Time.utc(dt.year, dt.month, dt.day, dt.hour, dt.min, dt.sec) - (dt.zone.to_f * 60 * 60)
      end
    end
  end
end
