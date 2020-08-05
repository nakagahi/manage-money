require 'test_helper'

class UserTest < ActiveSupport::TestCase

  # setup特殊メソッド　各テストの最初に呼び出される
  def setup
    @user = User.new(name: "Example User", email: "user@example.com")
  end

  test "shoule be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "   "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 244 + "@icloudddd.com"
    assert_not @user.valid?
  end

  test "email should be unique" do
    user_dup = @user.dup #dupは、同じ属性を持つデータを複製するためのメソッドです。
    @user.save
    user_dup.email = @user.email.upcase
    assert_not user_dup.valid?
  end

end
