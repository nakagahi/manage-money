require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  # 異常ルート
  test "invalid signup information" do
   get new_user_url
   assert_no_difference 'User.count' do
     post users_path, params: { user: { name:  "",
                                        email: "user@invalid.com",
                                        password:              "",
                                        password_confirmation: "nh10221022" } }
   end
   assert_template 'users/new'
  end

  # 正常ルート
  test "valid signup information" do
    get new_user_url
    assert_difference 'User.count' do
      post users_path, params: {user: { name: "久次米　北斗",
                                        email: "kuzi@icloud.com",
                                        password: "nh10221022",
                                        password_confirmation: "nh10221022"}}
    end
    follow_redirect!
    assert_template 'users/show'
  end

end
