class CreateWeatherDataTable < ActiveRecord::Migration[6.1]
  def change
    create_table :weather_data do |t|
      t.string :name
      t.datetime :date_time
      t.float :maximum_temperature
      t.float :minimum_temperature
      t.float :temperature
      t.float :wind_chill
      t.float :heat_index
      t.float :precipitation
      t.float :snow
      t.float :snow_depth
      t.float :wind_speed
      t.integer :wind_direction
      t.float :wind_gust
      t.float :visibility
      t.float :cloud_cover
      t.float :relative_humidity
      t.string :conditions
    end
  end
end
