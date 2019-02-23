class ForecastFacade
  def initialize(lat_lng)
    @lat_lng = lat_lng
    @_search_result = nil
  end

  def weather
    Weather.new(search_result)
  end

  private

  def search_result
    @_search_result ||= search
  end

  def search
    DarkskyService.new(@lat_lng).forecast
  end
end