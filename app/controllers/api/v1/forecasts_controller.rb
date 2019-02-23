class Api::V1::ForecastsController < ApplicationController
  def show
    lat_lng = GeocodeFacade.new(params[:location])
    render json: {'test' => 'test'}
  end
end