class Api::V1::ForecastsController < ApplicationController
  def show
    render json: {'test' => 'test'}
  end
end