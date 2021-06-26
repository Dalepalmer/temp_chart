class WeatherController < ApplicationController
  def index
    if params.include?('date_time') && params.include?('max_temp') && params.include?('min_temp')
      start_date = Date.parse(params['date_time'])
      @data = WeatherData.by_month(start_date)
      @data = @data.check_days(@data, params["max_temp"].to_i, params["min_temp"].to_i)
    else
      @data = WeatherData.all
    end
    respond_to do |format|
      format.html { 'index' }
      format.json { render json: @data }
    end
  end

  def show
    @data = WeatherData.find(params[:id].to_i)
    respond_to do |format|
      format.html { 'show' }
      format.json { render json: data }
    end
  end

end
