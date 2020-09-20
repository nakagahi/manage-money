class SessionsController < ApplicationController

before_action :not_log_in?, only: [:new, :create]
before_action :log_in?, only: [:destory]


  # ログインページへのアクション
  def new
  end

  # 簡単ログイン
  def easy

    @user = User.find_by(email: "sample@icloud.com")

    if @user && @user.authenticate("nh10221022")

      flash[:success] = "#{@user.name}さんようこそ!"
      log_in(@user)
      redirect_to @user
    else
      flash.now[:danger] = "ログインに失敗しました"
      render 'new'
    end

  end

  # ログインページから送られてきたPostリクエストに対する処理
  def create
    @user = User.find_by(email: params[:session][:email])

    if @user && @user.authenticate(params[:session][:password])

      flash[:success] = "#{@user.name}さんようこそ!"
      log_in(@user)
      redirect_to @user
    else
      flash.now[:danger] = "ログインに失敗しました"
      render 'new'
    end
  end

  def destroy
    log_out
    flash[:success] = "ログアウトしました。"
    redirect_to login_url
  end


private
  def not_log_in?
    if logged_in?

      flash.now[:danger] = "ログアウトしてください"
      redirect_to main_path
    end
  end

  def log_in?
    if !logged_in?
      flash[:danger] = "ログインしてください"
      render "home/top"
    end
  end
end
