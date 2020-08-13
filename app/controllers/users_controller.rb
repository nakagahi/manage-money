class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show

    @user = User.find(params[:id])
    @incomes = Income.where(user_id: @user.id)
    @total = @incomes.sum(:money)

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
    @users = User.all
  end



  private

  def usr_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
