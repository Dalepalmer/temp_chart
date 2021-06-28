class WeatherData < ApplicationRecord
  require 'csv'

  def self.by_month(date)
    start_date = DateTime.parse(date.to_s)
    WeatherData.where('date_time BETWEEN ? AND ?', start_date, start_date.end_of_month)
  end

  def self.check_days(data, max_temp, min_temp)
    resp = {}
    resp["date_range_start"] = data[0].date_time.beginning_of_month
    resp["date_range_end"] = data[0].date_time.end_of_month
    resp["heating_days"] = data.where('maximum_temperature > ?', max_temp.to_f).group(:date_time).count.length
    resp["cooling_days"] = data.where('minimum_temperature < ?', min_temp.to_f).group(:date_time).count.length
    resp
  end


  def check_data(data)
    count = 0
    counted_days = {}
    data.each do |datapoint| 
      date = datapoint[0].to_date
      if counted_days.key?(date)
        next
      else
        counted_days[date] = "moo"
        count += 1
      end
    end
    count
  end

  def self.heating_days(date, max_temp)
    month_data = WeatherData.by_month(date)
    month_data.where('temperature < ?', max_temp.to_f).count
  end

  def self.cooling_days(date, min_temp)
    month_data = WeatherData.by_month(date)
    month_data.where('temperature > ?', min_temp.to_f).count
  end
  
  def latitude
    name.split(", ")[0].to_f
  end

  def longitude
    name.split(", ")[1].to_f
  end


  def self.load_csv_data(file_path)
    input = CSV.read(file_path)
    weather_data = []
    input.each_with_index do |line, index|
      if index >= 1
        weather_data.push({name:line[0], date_time: Date.strptime(line[1], "%m/%d/%Y"), maximum_temperature: line[2], minimum_temperature: line[3], temperature: line[4], wind_chill: line[5], heat_index: line[6], precipitation: line[7], snow: line[8], snow_depth: line[9], wind_speed: line[10], wind_direction: line[11], wind_gust: line[12], visibility: line[13], cloud_cover: line[14], relative_humidity: line[15], conditions: line[16] })
      end
    end
    WeatherData.create(weather_data)
  end
end