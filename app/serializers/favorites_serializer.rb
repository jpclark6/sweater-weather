class FavoritesSerializer
  def self.make_json(user)
    favorites = []
    user.locations.each do |location|
      favorites << {location: pretty_location(location.city_state),
                    current_weather: ForecastSerializer.make_local_only_json(location.city_state)}

    end
    { data: favorites }
  end

  def self.make_individual_json(user, city_state)
    location = user.locations.find_by(city_state: city_state)
    {data: [{location: pretty_location(location.city_state),
                  current_weather: ForecastSerializer.make_local_only_json(location.city_state)}]}
  end

  def self.pretty_location(city_state)
    "#{city_state.split(',')[0].titleize}, #{city_state.split(',')[1].upcase}"
  end
end