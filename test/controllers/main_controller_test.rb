require 'test_helper'

class MainControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get main_home_url
    assert_response :success
  end

  test "should get top" do
    get main_top_url
    assert_response :success
  end

end
