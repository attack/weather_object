require 'weather_object'

RSpec.describe 'Forecast weather data' do
  it 'holds forecast weather data' do
    weather = WeatherObject.new
    weather.add_forecast(
      high: 20
    )

    expect(weather.forecast.first.high).to eq 20
  end
end
