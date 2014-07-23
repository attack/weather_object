require 'weather_object'

RSpec.describe 'Forecast weather data' do
  it 'holds forecast weather data' do
    weather = WeatherObject.new
    weather.add_forecast(
      high: 20,
      low: 5,
      pop: '25%',
      icon: 'sunny',
      condition: 'partly cloudy'
    )

    expect(weather.forecast.first.high.to_s).to eq '20 C'
    expect(weather.forecast.first.low.to_s).to eq '5 C'
    expect(weather.forecast.first.pop.to_s).to eq '25.0'
    expect(weather.forecast.first.icon.to_s).to eq 'sunny'
    expect(weather.forecast.first.condition.to_s).to eq 'partly cloudy'
  end
end
