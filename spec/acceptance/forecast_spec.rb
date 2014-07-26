require 'weather_object'

RSpec.describe 'Forecast weather data' do
  it 'holds forecast weather data' do
    weather = WeatherObject.new
    weather.add_forecast(
      starts_at: noon,
      ends_at: evening,
      high: 20,
      low: 5,
      pop: '25%',
      sun: WeatherObject::Data::Sun.new(rise: dawn, set: dusk),
      icon: 'sunny',
      condition: 'partly cloudy'
    )

    forecast = weather.forecast.first
    expect(forecast.starts_at.to_s).to eq '2014-02-22 12:00:00 UTC'
    expect(forecast.ends_at.to_s).to eq '2014-02-22 18:00:00 UTC'
    expect(forecast.high.to_s).to eq '20 C'
    expect(forecast.low.to_s).to eq '5 C'
    expect(forecast.pop.to_s).to eq '25.0'
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
