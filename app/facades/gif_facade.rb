class GifFacade 
  def initialize(weather_description)
    @weather_description = weather_description
    @_search_results = nil
  end

  def get_gif
    search_results[:data][0][:images][:original][:url]
  end

  private

  def search_results
    @_search_results ||= service.weather_gif
  end

  def service
    GiphyService.new(@weather_description)
  end
end