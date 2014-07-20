module WeatherObject
  class Measurements < Collection
    def current
      sort_by(&:observed_at).last
    end
  end
end
