class FlickrService
  def initialize(city_state)
    geo = GeocodeFacade.new(city_state)
    @city_state = city_state
    @lat = geo.lat
    @lng = geo.lng
  end

  def picture_data
    params = {lat: @lat, lon: @lng, accuracy: 11, tags: 'skyline,sunset',
              method: 'flickr.photos.search', tag_mode: 'all'}

    get_json('', params)
  end

  def find_picture_id
    picture_data[:photos][:photo].sample[:id]
  end

  def find_picture_url
    if Location.find_by(city_state: @city_state) && Location.find_by(city_state: @city_state).background_url
      url = Location.find_by(city_state: @city_state).background_url
    else
      loc = Location.find_or_create_by(city_state: @city_state)
      params = {method: 'flickr.photos.getSizes', photo_id: find_picture_id}
      url = ''
      until url[-3..-1] == 'jpg'
        url = get_json('', params)[:sizes][:size][-1][:source]
      end
      loc.update(background_url: url)
    end
    url
  end


  private

  def get_json(url, params)
    response = conn.get(url, params)

    JSON.parse(response.body[14..-2], symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://api.flickr.com/services/rest/') do |faraday|
      faraday.params[:api_key] = ENV['FLICKR_API_KEY']
      faraday.params[:format] = 'json'
      faraday.params[:safe_search] = '1'
      faraday.adapter Faraday.default_adapter
    end
  end
end
