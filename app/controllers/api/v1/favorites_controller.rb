class Api::V1::FavoritesController < Api::ApiController
  def index
    user = User.find_by(api_key: params[:api_key])
    if user
      render json: FavoritesSerializer.make_json(user)
    else
      render json: { status: 'Something went wrong.'}, status: 401
    end
  end

  def create
    user = User.find_by(api_key: params[:api_key])
    if user && params[:location]
      user.locations << Location.find_or_create_by(city_state: city_state) unless user.locations.find_by(city_state: city_state)
      render json: FavoritesSerializer.make_individual_json(user, city_state)
    else
      render json: { status: 'Something went wrong.'}, status: 401
    end
  end

  def destroy
    user = User.find_by(api_key: params[:api_key])
    location = user.locations.find_by(city_state: city_state) if user
    if user && location
      json = FavoritesSerializer.make_individual_json(user, city_state)
      user.locations.destroy(location.id)
      render json: json
    else
      render json: { "status": "Something went wrong" }, status: 401
    end
  end

  private

  def city_state
    city_state_format = params[:location].downcase.split(',')
    city_state_format[0].strip!
    city_state_format[1].strip! if city_state_format[1]
    city_state_format.join(',')
  end
end