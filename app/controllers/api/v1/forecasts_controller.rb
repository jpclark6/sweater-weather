class Api::V1::ForecastsController < ApplicationController
  def show
    render json: ForecastSerializer.make_json(params[:location])
  end
end