module WeatherObject
  class Collection
    include Enumerable

    def initialize(*collection)
      @collection = collection
    end

    def each(&block)
      collection.each(&block)
    end

    def add(item)
      collection << item
    end

    private

    attr_reader :collection
  end
end
