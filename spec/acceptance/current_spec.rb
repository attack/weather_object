require 'weather_object'

RSpec.describe 'Current weather data' do
  it 'holds current weather data' do
    weather = WeatherObject.new
    weather.add_measurement(
      time: now,
      temperature: 20,
      apparent_temperature: 21,
      pop: '25%',
      dew_point: 10,
      heat_index: 25,
      wind_chill: 18,
      wind: 10,
      pressure: 100,
      visibility: 50,
      humidity: 0.75,
      cloud_cover: '15%',
      daylight: [sunrise, sunset],
      ozone: 3,
      icon: 'wind',
      summary: 'windy and sunny'
    )

    expect(weather.current.time.to_s).to eq '2014-02-22 09:45:00 UTC'
    expect(weather.current.temperature.to_s).to eq '20 C'
    expect(weather.current.apparent_temperature.to_s).to eq '21 C'
    expect(weather.current.pop.to_s).to eq '25.0 %'
    expect(weather.current.dew_point.to_s).to eq '10 C'
    expect(weather.current.heat_index.to_s).to eq '25 C'
    expect(weather.current.wind_chill.to_s).to eq '18 C'
    expect(weather.current.wind.to_s).to eq '10 kph'
    expect(weather.current.pressure.to_s).to eq '100 mb'
    expect(weather.current.visibility.to_s).to eq '50 km'
    expect(weather.current.humidity.to_s).to eq '75.0 %'
    expect(weather.current.cloud_cover.to_s).to eq '15.0 %'
    expect(weather.current.daylight.starts_at.to_s).to eq '2014-02-22 07:50:00 UTC'
    expect(weather.current.daylight.ends_at.to_s).to eq '2014-02-22 17:30:00 UTC'
    expect(weather.current.ozone.to_s).to eq '3 DU'
    expect(weather.current.icon.to_s).to eq 'wind'
    expect(weather.current.summary.to_s).to eq 'windy and sunny'
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
