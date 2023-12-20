require "test_helper"

class WeeklyCalendarControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get weekly_calendar_show_url
    assert_response :success
  end
end
