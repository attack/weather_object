require 'weather_object'

RSpec.describe 'Current weather data' do
  it 'holds current weather data' do
    weather = WeatherObject.new
    weather.add_measurement(
      time: now,
      temperature: 20,
      dew_point: 10,
      heat_index: 25,
      wind_chill: 18,
      wind: 10,
      pressure: 100,
      visibility: 50,
      humidity: '75 %',
      daylight: [sunrise, sunset],
      icon: 'wind',
      condition: 'windy and sunny'
    )

    expect(weather.current.time.to_s).to eq '2014-02-22 09:45:00 UTC'
    expect(weather.current.temperature.to_s).to eq '20 C'
    expect(weather.current.dew_point.to_s).to eq '10 C'
    expect(weather.current.heat_index.to_s).to eq '25 C'
    expect(weather.current.wind_chill.to_s).to eq '18 C'
    expect(weather.current.wind.to_s).to eq '10 kph'
    expect(weather.current.pressure.to_s).to eq '100 mb'
    expect(weather.current.visibility.to_s).to eq '50 km'
    expect(weather.current.humidity.to_s).to eq '75.0 %'
    expect(weather.current.daylight.starts_at.to_s).to eq '2014-02-22 07:50:00 UTC'
    expect(weather.current.daylight.ends_at.to_s).to eq '2014-02-22 17:30:00 UTC'
    expect(weather.current.icon.to_s).to eq 'wind'
    expect(weather.current.condition.to_s).to eq 'windy and sunny'
  end

  def sunrise
    ::Time.utc(2014, 02, 22, 7, 50, 0)
  end

  def now
    ::Time.utc(2014, 02, 22, 9, 45, 0)
  end

  def sunset
    ::Time.utc(2014, 02, 22, 17, 30, 0)
  end
end
