class SessionsController < ApplicationController

  # ログインページへのアクション
  def new
  end

  # ログインページから送られてきたPostリクエストに対する処理
  def create
    @user = User.find_by(email: params[:session][:email])

    if @user && @user.authenticate(params[:session][:password])

      flash[:success] = "#{@user.name}さんようこそ!"
      log_in(@user)
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    log_out
    flash[:success] = "ログアウトしました。"
    redirect_to login_url
  end
end
