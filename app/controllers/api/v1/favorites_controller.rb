class Api::V1::FavoritesController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    if user && params[:location]
      city_state = format_city_state(params[:location])
      user.locations << Location.find_or_create_by(city_state: city_state)
      render json: { status: 'Favorite added successfully' }
    else
      render json: { status: 'Something went wrong.'}, status: 401
    end
  end

  def index
    user = User.find_by(api_key: params[:api_key])
    if user
      render json: FavoritesSerializer.make_json(user)
    else
      render json: { status: 'Something went wrong.'}, status: 401
    end
  end

  private

  def format_city_state(city_state)
    city_state = city_state.downcase.split(',')
    city_state[0].strip!
    city_state[1].strip!
    city_state = city_state.join(',')
  end
end