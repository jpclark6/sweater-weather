class ForecastSerializer
  def self.make_json(city_state)
    forecast = ForecastFacade.new(lat_lng(city_state)).weather
    current = { 
              time: forecast.current_time,
              temperature: forecast.current_temp,
              feels_like: forecast.current_feels_like,
              humidity: forecast.current_humidity,
              visibility: forecast.current_visibility_mi,
              uv_index: forecast.current_uv_index,
              description: forecast.current_status
              }
    hourly = []
    24.times do |hour|
      hourly[hour] = {
                      time: forecast.hourly_time(hour),
                      temperature: forecast.hourly_temperature(hour)
                     }
    end
    daily = []
    7.times do |day|
      daily[day] = {
                    time: forecast.daily_time(day),
                    high: forecast.high(day),
                    low: forecast.low(day),
                    status: forecast.status(day),
                    tonight_status: forecast.tonight_status(day),
                    humidity: forecast.humidity(day),
                   }
    end
    { data: [currently: current, hourly: hourly, daily: daily] }
  end

  def self.lat_lng(city_state)
    GeocodeFacade.new(city_state).lat_lng
  end
end