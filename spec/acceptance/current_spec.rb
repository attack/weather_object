require 'weather_object'

RSpec.describe 'Current weather data' do
  it 'holds current weather data' do
    weather = WeatherObject.new
    weather.add_measurement(
      temperature: 20,
      dew_point: 10,
      heat_index: 25,
      wind_chill: 18
    )

    expect(weather.current.temperature.to_s).to eq '20 C'
    expect(weather.current.dew_point.to_s).to eq '10 C'
    expect(weather.current.heat_index.to_s).to eq '25 C'
    expect(weather.current.wind_chill.to_s).to eq '18 C'
  end
end
