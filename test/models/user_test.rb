require 'test_helper'

class UserTest < ActiveSupport::TestCase

  # setup特殊メソッド　各テストの最初に呼び出される
  def setup
    @user = User.new(name: "Example User", email: "user@example.com")
  end

  test "shoule be valid" do
    assert @user.valid?
  end
end
