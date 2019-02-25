class WeatherGifFacade
  def initialize(city_state)
    lat_lng = GeocodeFacade.new(city_state).lat_lng
    @weather = ForecastFacade.new(lat_lng).weather
  end

  def build_days
    (0..6).map do |day|
      WeatherGif.new(@weather, day)
    end
  end
end