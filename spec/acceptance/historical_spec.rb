require 'weather_object'

RSpec.describe 'Historical weather data' do
  it 'holds historical weather data' do
    weather = WeatherObject.new
    weather.add_history(
      temperature: 20
    )

    expect(weather.history.first.temperature).to eq 20
  end
end
