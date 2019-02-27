class GeocodeFacade
  def initialize(city_state)
    @city_state = city_state
    @_search_result = nil
    @_find_city = nil
  end

  def lat_lng
    "#{lat},#{lng}"
  end

  def lat
    if cached_city && cached_city.lat
      cached_city.lat
    else
      loc = Location.find_or_create_by(city_state: @city_state)
      loc.update(lat: location[:lat])
      loc.lat
    end
  end

  def lng
    if cached_city && cached_city.lng
      cached_city.lng
    else
      loc = Location.find_or_create_by(city_state: @city_state)
      loc.update(lng: location[:lng])
      loc.lng
    end
  end

  def location
    search_result[:results][0][:geometry][:location]
  end

  private

  def cached_city
    @_find_city ||= Location.find_by(city_state: @city_state)
  end

  def search_result
    @_search_result ||= service.lat_lng
  end

  def service
    GoogleGeocodeService.new(@city_state)
  end
end