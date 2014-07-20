require 'weather_object'

RSpec.describe 'Weather data' do
  it 'holds generic weather data' do
    weather = WeatherObject.new(
      query: 'New York, NY'
    )

    expect(weather.query).to eq 'New York, NY'
  end
end
