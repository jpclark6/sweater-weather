class Api::V1::GifsController < Api::ApiController
  def index
    weather_gifs = WeatherGifFacade.new(params[:location]).build_days
    render json: WeatherGifSerializer.make_json(weather_gifs)
  end
end