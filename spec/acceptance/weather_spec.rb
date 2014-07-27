require 'weather_object'

RSpec.describe 'Weather data' do
  it 'holds generic weather data' do
    weather = WeatherObject.new(
      query: 'New York, NY',
      source: :foo_weather,
      format: :coordinates,
      metadata: {
        foo: 'bar',
        baz: true
      }
    )

    expect(weather.query).to eq 'New York, NY'
    expect(weather.source).to eq :foo_weather
    expect(weather.format).to eq :coordinates
    expect(weather.metadata).to eq(
      foo: 'bar',
      baz: true
    )
  end
end
