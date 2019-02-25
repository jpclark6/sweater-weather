class WeatherGif
  def initialize(weather, day)
    @weather = weather
    @day = day
  end

  def time
    @weather.daily_time(@day)
  end

  def gif
    GifFacade.new(summary).get_gif
  end

  def summary
    @weather.status(@day)
  end
end