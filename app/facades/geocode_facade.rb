class GeocodeFacade
  def initialize(city_state)
    @city_state = city_state
    @_search_result = nil
    @_cached_city = nil
    @_cache_city = nil
  end

  def lat_lng
    "#{lat},#{lng}"
  end

  def lat
    if cached_city && cached_city.lat
      cached_city.lat
    else
      cache_city.update(lat: location[:lat])
      cache_city.lat
    end
  end

  def lng
    if cached_city && cached_city.lng
      cached_city.lng
    else
      cache_city.update(lng: location[:lng])
      cache_city.lng
    end
  end

  def location
    search_result[:results][0][:geometry][:location]
  end

  private

  def cache_city
    @_cache_city ||= Location.find_or_create_by(city_state: @city_state)
  end

  def cached_city
    @_cached_city ||= Location.find_by(city_state: @city_state)
  end

  def search_result
    @_search_result ||= service.lat_lng
  end

  def service
    GoogleGeocodeService.new(@city_state)
  end
end