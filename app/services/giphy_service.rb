class GiphyService
  def initialize(image_description)
    @image_description = image_description
  end

  def gif_data
    get_json("/v1/gifs/search", {q: @image_description})
  end

  private

  def get_json(url, params)
    response = conn.get(url, params)

    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://api.giphy.com') do |faraday|
      faraday.params[:api_key] = ENV['GIPHY_API_KEY']
      faraday.adapter Faraday.default_adapter
    end
  end
end