module WeatherObject
  class Measurements
    include Enumerable

    def initialize(*measurements)
      @measurements = measurements || []
    end

    def each(&block)
      measurements.each(&block)
    end

    def add(measurement)
      measurements << measurement
    end

    def current
      sort_by(&:observed_at).last
    end

    private

    attr_reader :measurements
  end
end
