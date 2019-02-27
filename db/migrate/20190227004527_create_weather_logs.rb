class CreateWeatherLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :weather_logs do |t|
      t.string :lat_lng
      t.text :data

      t.timestamps
    end
  end
end
