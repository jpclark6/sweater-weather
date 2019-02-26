class FavoritesSerializer
  def self.make_json(user)
    favorites = []
    user.locations.each do |location|
      favorites << {location: pretty_location(location.city_state),
                    current_weather: ForecastSerializer.make_json(location.city_state)}

    end
    { data: favorites }
  end

  def self.pretty_location(city_state)
    "#{city_state.split(',')[0].titleize}, #{city_state.split(',')[1].upcase}"
  end
end