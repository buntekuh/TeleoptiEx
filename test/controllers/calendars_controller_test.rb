require 'test_helper'

class CalendarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @calendar = calendars(:one)
  end

  test "should get index" do
    get calendars_url
    assert_response :success
  end

  test "should create calendar" do
    assert_difference('Calendar.count', 1) do
      post calendars_url, params: { name: "Blumm", format: 'json' }
    end
    assert_response :created

    assert_difference('Calendar.count', 0) do
      post calendars_url, params: { name: "Blumm", format: 'json' }
    end
    assert_response :unprocessable_entity
  end

  test "should show calendar" do
    get "/calendar/#{@calendar.name}"
    assert_response :success
  end
  #
  test "should get edit" do
    get "/calendar/#{@calendar.name}/edit"
    assert_response :success
  end
  #
  # test "should update calendar" do
  #   patch calendar_url(@calendar), params: { name: @calendar.name } }
  #   assert_response :success
  # end
end
