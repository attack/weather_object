require 'weather_object/version'
require 'weather_object/base'

module WeatherObject
  def self.new(attributes={})
    Base.new(attributes)
  end
end
