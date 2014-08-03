module WeatherObject
  module Data
    class MoonPhase < Percentage
      def to_s
        "#{percentage} (#{description})"
      end

      private

      def percentage
        sprintf "%.0f\%", (to_f * 100)
      end

      def description
        case to_f
        when 0
          'new moon'
        when 0.0...0.25
          'waxing crescent'
        when 0.25
          'first quarter moon'
        when 0.25...0.5
          'waxing gibbous'
        when 0.5
          'full moon'
        when 0.5...0.75
          'waning gibbous'
        when 0.75
          'last quarter moon'
        when 0.75..1.0
          'waning crescent'
        end
      end
    end
  end
end
