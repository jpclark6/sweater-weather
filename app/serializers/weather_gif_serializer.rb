class WeatherGifSerializer
  def self.make_json(weather_gifs)
    { 
      data: {images: weather_gifs},
      copyright: "2019"
    }
  end
end