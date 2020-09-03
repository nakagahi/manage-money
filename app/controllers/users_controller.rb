class UsersController < ApplicationController
before_action :logged_in_user, only: [:edit, :update, :destroy]
before_action :correct_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def show

    @user = User.find(params[:id])
    @incomes = Income.where(user_id: @user.id)
    @outcomes = Output.where(user_id: @user.id)

    @total = @incomes.sum(:money) - @outcomes.sum(:money)

  end

  def create
    @user = User.new(usr_params)

    if @user.save
      log_in @user
      flash[:success] = "#{@user.name}さんを登録しました。"
      redirect_to @user
    else
      flash.now[:danger] = "失敗しました。。"
      render 'new'
    end
  end

  def index
    @users = User.order(id: "ASC").page(params[:page]).per(10)
  end

# edit_user GET    /users/:id/edit
  def edit
    @user = User.find(params[:id])
  end

  def update

    @user = User.find(params[:id])

    if @user.update(usr_params)

    flash[:success] = "更新に成功しました!"
    redirect_to users_url
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:danger] = "削除が完了しました。"
    redirect_to users_url
  end

  def moneys

    @user = User.find(params[:id])

    @incomes = Income.where(user_id: @user.id)
    @outcomes = Output.where(user_id: @user.id)

  end

  private

  def usr_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  # ログイン済ユーザかどうかの検証
  def logged_in_user
    unless logged_in?
      flash[:danger] = "ログインしてください"
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find(params[:id])

    if @user != current_user
      flash[:danger] = "他のユーザの編集はできません"
      redirect_to(root_url)
    end

  end

end
