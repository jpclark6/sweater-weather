class WeatherGifSerializer
  def self.make_json(city_state)
    weather_gifs = WeatherGifFacade.new(city_state).build_days
    { 
      data: {images: weather_gifs},
      copyright: "2019"
    }
  end
end