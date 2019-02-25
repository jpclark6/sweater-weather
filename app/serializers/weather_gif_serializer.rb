class WeatherGifSerializer
  def self.make_json(city_state)
    weather_gifs = WeatherGifFacade.new(params[:location]).build_days
    { 
      data: {images: weather_gifs},
      copyright: "2019"
    }
  end
end