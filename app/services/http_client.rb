class HttpClient
  require 'net/http'
  require 'json'

  BASE_URL = "http://api.openweathermap.org/data/2.5/".freeze
  API_KEY = Rails.application.secrets.api_key

  def self.get_weather(city)
    if API_KEY.nil? || API_KEY.empty?
      raise StandardError, 'API Key not found'
    end

    url = fetch_url(city)
    response = Net::HTTP.get(URI(url))
    response_body = JSON.parse(response)

    if response_body['cod'] == 200
      response_body
    else
      nil # Handle error cases
    end
  end

  def self.fetch_url(city)
    "#{BASE_URL}/weather?q=#{city}&APPID=#{API_KEY}"
  end

end

