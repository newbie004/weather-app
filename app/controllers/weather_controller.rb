class WeatherController < ApplicationController
  protect_from_forgery with: :null_session
  def process_location
    @city = params[:city]
    @weather_info = fetch_weather_info(@city)
    session[:weather_info] = @weather_info.to_json
    redirect_to "/show_weather"
  end

  def fetch_weather_info(city)
    WeatherInfoService.new(@city).fetch
  end
end
