class Api::V1::FavoritesController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    if user && params[:location]
      user.locations << Location.find_or_create_by(city_state: params[:location].downcase.delete(" "))
      render json: { status: 'Favorite added successfully' }
    else
      render json: { status: 'Something went wrong.'}, status: 401
    end
  end

  def index
    binding.pry
  end
end