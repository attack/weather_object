require 'virtus'

module WeatherObject
  class Base
    include Virtus.model

    attribute :query, String
    attribute :weight, Integer, default: 1
    attribute :status_code, Integer

    attribute :history, WeatherObject::Measurements

    def current
      history.current
    end

    def add_measurement(attributes={})
      history.add Measurement.new(attributes)
    end
  end
end
