# README



Things you may want to cover:

* Ruby version: 2.6.7

* System dependencies

* Configuration

* Database creation

`rake db:create`

* Database initialization

`rake db:create`

How to run locally


 1. Navigate to project directory and run `bundle`
 2. Run `yarn` in the same directory
 4. Create and initialize the database
 5. Load database with weather data `rake data:load_csv_data`
 6. Start the rails server with  `rails s`
 7. State the webpack server in another terminal window to serve assets  `./bin/webpack-dev-server`
 8. Navigate to localhost:3000 to see the weather UI
 9. To see the json respone navigate to localhost:3000.json/?date_time="01/07/2020"&min_temp=65&max_temp=72

To see the demo site navigate [here](https://weather-portal11.herokuapp.com/). Heroku can take a moment to spin up on first load.
