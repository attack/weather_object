require 'virtus'

module WeatherObject
  class Base
    include Virtus.model

    attribute :query, String
    attribute :weight, Integer, default: 1
    attribute :status_code, Integer
  end
end
