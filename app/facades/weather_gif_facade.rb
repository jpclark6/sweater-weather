class WeatherGifFacade
  def initialize(city_state)
    lat_lng = GeocodeFacade.new(city_state).lat_lng
    @weather = ForecastFacade.new(lat_lng).weather
  end

  def build_days
    (0..6).map do |day|
      gif_data = WeatherGif.new(@weather, day)
      {time: gif_data.time, summary: gif_data.summary, url: gif_data.gif}
    end
  end
end