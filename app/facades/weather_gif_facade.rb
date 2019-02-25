class WeatherGifFacade
  def initialize(city_state)
    lat_lng = GeocodeFacade.new(city_state).lat_lng
    @weather = ForecastFacade.new(lat_lng)
  end

  def build_days
    7.times do |day|
      WeatherGif.new(@weather, day)
    end
  end
end