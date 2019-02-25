class Api::V1::GifsController < ApplicationController
  def index
    render json: {'test' => 'test'}
  end
end