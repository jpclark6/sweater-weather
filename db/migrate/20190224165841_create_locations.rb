class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :city_state
      t.string :lat
      t.string :lng
      t.string :background_url
    end
  end
end
