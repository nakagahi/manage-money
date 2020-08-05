require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest

  # ベースメソッド
  def setup
    @base_title = "Manage Money"
  end

  # トップページヘのルートのテスト
  test "should get top" do
    get root_url
    assert_response :success
    assert_select "title", @base_title
  end

  # 説明ページヘのルートのテスト
  test "should get about" do
    get about_url
    assert_response :success
    assert_select "title", @base_title
  end
end
