require 'weather_object'

RSpec.describe 'Weather data' do
  it 'holds generic weather data' do
    weather = WeatherObject.new(
      recorded_at: now,
      query: 'New York, NY',
      source: :foo_weather,
      format: :coordinates,
      metadata: {
        foo: 'bar',
        baz: true
      }
    )

    expect(weather.recorded_at.to_s).to eq '2014-02-22 10:58:34 UTC'
    expect(weather.query).to eq 'New York, NY'
    expect(weather.source).to eq :foo_weather
    expect(weather.format).to eq :coordinates
    expect(weather.metadata).to eq(
      foo: 'bar',
      baz: true
    )
  end

  def now
    ::Time.utc(2014, 2, 22, 10, 58, 34)
  end
end
