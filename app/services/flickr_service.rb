class FlickrService
  def initialize(city_state)
    geo = GeocodeFacade.new(city_state)
    @lat = geo.lat
    @lng = geo.lng
  end

  def find_picture_id
    params = {lat: @lat, lon: @lng, accuracy: 11, tags: 'skyline,sunset',
              method: 'flickr.photos.search', tag_mode: 'all'}

    get_json('', params)[:photos][:photo].sample[:id]
  end

  def find_picture_url(id)
    params = {method: 'flickr.photos.getSizes', photo_id: id}

    x = get_json('', params)
    binding.pry
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
