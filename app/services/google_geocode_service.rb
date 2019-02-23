class GoogleGeocodeService
  def initialize(city_state)
    @city_state = city_state
  end

  def lat_lng
    get_json("/maps/api/geocode/json?address=#{@city_state}")
  end

  private

  def get_json(url)
    response = conn.get(url)

    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://maps.googleapis.com') do |faraday|
      faraday.params['key'] = ENV['GOOGLE_API_KEY']
      faraday.adapter Faraday.default_adapter
    end
  end
end