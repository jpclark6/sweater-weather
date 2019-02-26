class ForecastSerializer
  def self.make_json(city_state)
    forecast = ForecastFacade.new(lat_lng(city_state)).weather
    { data: {currently: forecast.current, hourly: forecast.hourly_weather, daily: forecast.daily_weather} }
  end

  def self.make_local_only_json(city_state)
    forecast = ForecastFacade.new(lat_lng(city_state)).weather
    {currently: forecast.current}
  end

  def self.lat_lng(city_state)
    GeocodeFacade.new(city_state).lat_lng
  end
end