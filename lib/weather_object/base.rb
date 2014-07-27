require 'virtus'

module WeatherObject
  class Base
    include Virtus.model

    attribute :recorded_at, Attribute::Time
    attribute :query, String
    attribute :source, Symbol
    attribute :format, Symbol
    attribute :metadata, Hash

    attribute :history, Measurements
    attribute :forecast, Predictions

    def current
      history.current
    end

    def add_measurement(attributes={})
      history.add Measurement.new(attributes)
    end
    alias_method :add_history, :add_measurement

    def add_forecast(attributes={})
      forecast.add Prediction.new(attributes)
    end
  end
end
