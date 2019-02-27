class ForecastFacade
  def initialize(lat_lng)
    @lat_lng = lat_lng
    @_search_result = nil
  end

  def weather
    if weather_data_exists?
      Weather.new(saved_search_result)
    else
      WeatherLog.create(lat_lng: @lat_lng, data: search_result.to_json)
      Weather.new(search_result)
    end
  end

  private

  def weather_data_exists?
    weather = WeatherLog.find_by(lat_lng: @lat_lng)
    if weather && weather.updated_at < 4.hours.ago
      weather
    else
      false
    end
  end

  def saved_search_result
    JSON.parse(WeatherLog.find_by(lat_lng: @lat_lng).data, symbolize_names: true)
  end

  def search_result
    @_search_result ||= search
  end

  def search
    DarkskyService.new(@lat_lng).forecast
  end
end