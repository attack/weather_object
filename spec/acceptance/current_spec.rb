require 'weather_object'

RSpec.describe 'Current weather data' do
  it 'holds current weather data' do
    weather = WeatherObject.new
    weather.add_measurement(
      temperature: 20
    )

    expect(weather.current.temperature).to eq 20
  end
end