module WeatherObject
  module Data
    class Rate < ConvertableUnits
      def mm_per_hour; metric; end
      def in_per_hour; imperial; end

      def units
        metric? ? 'mm/hr' : 'in/hr'
      end

      private

      def convert_imperial_to_metric(imperial_value)
        imperial_value * 25.4
      end

      def convert_metric_to_imperial(metric_value)
        metric_value / 25.4
      end

      def significant_digits
        3
      end
    end
  end
end
