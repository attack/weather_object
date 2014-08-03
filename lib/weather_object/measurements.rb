module WeatherObject
  class Measurements < Collection
    def current
      sort_by(&:time).last
    end
  end
end
