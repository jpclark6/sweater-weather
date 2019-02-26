class CreateUserLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :user_locations do |t|
      t.resources :user
      t.resources :location
    end
  end
end
