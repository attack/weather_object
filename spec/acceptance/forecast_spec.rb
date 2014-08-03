require 'weather_object'

RSpec.describe 'Forecast weather data' do
  it 'holds forecast weather data' do
    weather = WeatherObject.new
    weather.add_forecast(
      time: [noon, evening],
      temperature: [5, 20],
      apparent_temperature: [6, 21],
      humidity: 0.75,
      wind: 12,
      dew_point: 3,
      visibility: 10,
      cloud_cover: '15%',
      daylight: [sunrise, sunset],
      moon_phase: 0.5,
      ozone: 3,
      icon: 'sunny',
      summary: 'partly cloudy',
      precipitation: {
        probability: '25%'
      }
    )

    forecast = weather.forecast.first
    expect(forecast.time.starts_at.to_s).to eq '2014-02-22 12:00:00 UTC'
    expect(forecast.time.ends_at.to_s).to eq '2014-02-22 18:00:00 UTC'
    expect(forecast.temperature.high.to_s).to eq '20 C'
    expect(forecast.temperature.low.to_s).to eq '5 C'
    expect(forecast.apparent_temperature.high.to_s).to eq '21 C'
    expect(forecast.apparent_temperature.low.to_s).to eq '6 C'
    expect(forecast.humidity.to_s).to eq '75.0 %'
    expect(forecast.wind.to_s).to eq '12 kph'
    expect(forecast.dew_point.to_s).to eq '3 C'
    expect(forecast.visibility.to_s).to eq '10 km'
    expect(forecast.cloud_cover.to_s).to eq '15.0 %'
    expect(forecast.daylight.starts_at.to_s).to eq '2014-02-22 07:50:00 UTC'
    expect(forecast.daylight.ends_at.to_s).to eq '2014-02-22 17:30:00 UTC'
    expect(forecast.moon_phase.to_s).to eq '50% (full moon)'
    expect(forecast.ozone.to_s).to eq '3 DU'
    expect(forecast.icon.to_s).to eq 'sunny'
    expect(forecast.summary.to_s).to eq 'partly cloudy'
    expect(forecast.precipitation.probability.to_s).to eq '25.0 %'
  end

  def sunrise
    ::Time.utc(2014, 02, 22, 7, 50, 0)
  end

  def noon
    ::Time.utc(2014, 02, 22, 12, 0, 0)
  end

  def sunset
    ::Time.utc(2014, 02, 22, 17, 30, 0)
  end

  def evening
    ::Time.utc(2014, 02, 22, 18, 0, 0)
  end
end
