class MoneysController < ApplicationController
  def manage

    @user = User.find(params[:id])

    @incomes = Income.where(user_id: @user.id)
    @outcomes = Output.where(user_id: @user.id)

  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def create
  end
end
