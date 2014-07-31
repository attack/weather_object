require 'weather_object'

RSpec.describe 'Forecast weather data' do
  it 'holds forecast weather data' do
    weather = WeatherObject.new
    weather.add_forecast(
      time: [noon, evening],
      temperature: [5, 20],
      pop: '25%',
      humidity: '75%',
      dew_point: 3,
      sun: WeatherObject::Data::Sun.new(rise: dawn, set: dusk),
      icon: 'sunny',
      condition: 'partly cloudy'
    )

    forecast = weather.forecast.first
    expect(forecast.time.starts_at.to_s).to eq '2014-02-22 12:00:00 UTC'
    expect(forecast.time.ends_at.to_s).to eq '2014-02-22 18:00:00 UTC'
    expect(forecast.temperature.high.to_s).to eq '20 C'
    expect(forecast.temperature.low.to_s).to eq '5 C'
    expect(forecast.pop.to_s).to eq '25.0'
    expect(forecast.humidity.to_s).to eq '75.0'
    expect(forecast.dew_point.to_s).to eq '3 C'
    expect(forecast.sun.to_s).to eq 'rise: 07:50, set: 17:30'
    expect(forecast.icon.to_s).to eq 'sunny'
    expect(forecast.condition.to_s).to eq 'partly cloudy'
  end

  def dawn
    ::Time.utc(2014, 02, 22, 7, 50, 0)
  end

  def noon
    ::Time.utc(2014, 02, 22, 12, 0, 0)
  end

  def dusk
    ::Time.utc(2014, 02, 22, 17, 30, 0)
  end

  def evening
    ::Time.utc(2014, 02, 22, 18, 0, 0)
  end
end
