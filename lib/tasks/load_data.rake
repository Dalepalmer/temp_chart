namespace :data do
  desc "loads in initial data from the csv"
  task load_csv_data: :environment do
    WeatherData.load_csv_data("public/history_data_hourly.csv")
  end
end