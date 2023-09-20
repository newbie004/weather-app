require "test_helper"

class WeatherControllerTest < ActionDispatch::IntegrationTest
  test "should get process_location" do
    get weather_process_location_url
    assert_response :success
  end
end
