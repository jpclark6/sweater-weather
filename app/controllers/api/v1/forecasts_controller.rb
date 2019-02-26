class Api::V1::ForecastsController < Api::ApiController
  def show
    render json: ForecastSerializer.make_json(params[:location])
  end
end