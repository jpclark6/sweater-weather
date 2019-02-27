class Api::V1::FavoritesController < Api::ApiController
  def create
    user = User.find_by(api_key: params[:api_key])
    if user && params[:location]
      city_state = format_city_state(params[:location])
      user.locations << Location.find_or_create_by(city_state: city_state) unless user.locations.find_by(city_state: city_state)
      render json: FavoritesSerializer.make_individual_json(user, format_city_state(params[:location]))
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

  def destroy
    city_state = format_city_state(params[:location])
    user = User.find_by(api_key: params[:api_key])
    location = user.locations.find_by(city_state: city_state) if user
    if user && location
      json = FavoritesSerializer.make_individual_json(user, format_city_state(params[:location]))
      user.locations.destroy(location.id)
      render json: json
    else
      render json: { "status": "Something went wrong" }, status: 401
    end
  end

  private

  def format_city_state(city_state)
    city_state = city_state.downcase.split(',')
    city_state[0].strip!
    city_state[1].strip! if city_state[1]
    city_state = city_state.join(',')
  end
end