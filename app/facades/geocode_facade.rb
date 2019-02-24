class GeocodeFacade
  def initialize(city_state)
    @city_state = city_state
    @_search_result = nil
  end

  def lat_lng
    "#{lat},#{lng}"
  end

  def lat
    if Location.find_by(city_state: @city_state) && Location.find_by(city_state: @city_state).lat
      Location.find_by(city_state: @city_state).lat
    else
      loc = Location.find_or_create_by(city_state: @city_state)
      loc.update(lat: location[:lat])
      loc.lat
    end
  end

  def lng
    if Location.find_by(city_state: @city_state) && Location.find_by(city_state: @city_state).lng
      Location.find_by(city_state: @city_state).lng
    else
      loc = Location.find_or_create_by(city_state: @city_state)
      loc.update(lng: location[:lng])
      loc.lng
    end
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