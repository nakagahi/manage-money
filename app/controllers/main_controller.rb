class MainController < ApplicationController

  before_action :set_series, only: [:income, :save]

  def top
  end

  def income

  end

  def outcome

  end

  def save
    @income = Income.new(money: params[:money], user_id: current_user.id, month: params[:month], series: params[:series])

    if @income.valid?
      flash[:success] = "収入の登録が完了しました。"
      @income.save
      redirect_to user_path current_user.id
    else
      flash.now[:danger] = "収入の登録に失敗しました。"
      render "/main/income"
    end
  end

  private

    def set_series
      @series = InputType.all
    end


end
