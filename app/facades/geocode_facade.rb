class GeocodeFacade
  def initialize(city_state)
    @city_state = city_state
    @_search_result = nil
  end

  def lat_lng
    "#{location[:lat]},#{location[:lng]}"
  end

  def location
    service.lat_lng[:results][0][:geometry][:location]
  end

  private

  def search_result
    @_search_result ||= service.lat_lng
  end

  def service
    GoogleGeocodeService.new(@city_state)
  end
end