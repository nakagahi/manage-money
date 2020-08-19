module SessionsHelper

  # ログインヘルパー
  def log_in(user)
      session[:user_id] = user.id
  end

  # ログインメソッド
  def current_user

    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end

  end

  def current_user?(user)
    if current_user == user
      return true
    end
  end

  # ログイン確認メソッド
  def logged_in?
    !current_user.nil?
  end

  # ログアウトメソッド
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
