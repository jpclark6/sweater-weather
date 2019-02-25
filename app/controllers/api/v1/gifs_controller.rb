class Api::V1::GifsController < ApplicationController
  def index
    render json: WeatherGifSerializer.make_json(params[:location])
  end
end