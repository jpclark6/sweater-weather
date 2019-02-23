class DarkskyService
  def initialize(lat_lng)
    @lat_lng = lat_lng
  end

  def forecast
    get_json("/forecast/#{ENV['DARKSKY_API_KEY']}/#{@lat_lng}")
  end

  private

  def get_json(url)
    response = conn.get(url)

    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://api.darksky.net') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
end