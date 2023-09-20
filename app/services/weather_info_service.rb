class WeatherInfoService

    attr_accessor :city

    def initialize(city)
        @city = city
    end
    
    def fetch
        HttpClient.get_weather(city)
    end

end


