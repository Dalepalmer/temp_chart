# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_06_21_152529) do

  create_table "weather_data", force: :cascade do |t|
    t.string "name"
    t.datetime "date_time"
    t.float "maximum_temperature"
    t.float "minimum_temperature"
    t.float "temperature"
    t.float "wind_chill"
    t.float "heat_index"
    t.float "precipitation"
    t.float "snow"
    t.float "snow_depth"
    t.float "wind_speed"
    t.integer "wind_direction"
    t.float "wind_gust"
    t.float "visibility"
    t.float "cloud_cover"
    t.float "relative_humidity"
    t.string "conditions"
  end

end