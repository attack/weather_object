module WeatherObject
  class Predictions < Collection
    def for(time)
      return nil unless collection.size > 0

      time = case time
        when Date
          ::Time.utc(time.year,time.month,time.day,12,0,0)
        else
          Utils::Time.parse(time)
        end

      collection.detect{ |prediction| prediction.cover?(time) }
    end
  end
end
