class MainController < ApplicationController

  before_action :set_incomeseries, only: [:income, :save]
  before_action :set_outcome_series, only: [:income, :outcome, :save]

  def top

    @blogs = []

    blog = Blog.find_by(user_id: current_user)

    if !blog.nil?

      @blogs.push(blog)

    end


  end

  def income

  end

  def outcome

  end

  def save

    if !params[:out]
      @income = Income.new(money: params[:money], user_id: current_user.id, month: params[:month], series: params[:series])

      if @income.valid?
        flash[:success] = "収入の登録が完了しました。"
        @income.save
        redirect_to user_path current_user.id
      else
        flash.now[:danger] = "収入の登録に失敗しました。"
        render "/main/income"
      end

    else
      @outcome = Output.new(money: params[:money], user_id: current_user.id, month: params[:month], series: params[:series])

      if @outcome.valid?
        flash[:success] = "支出の登録が完了しました。"
        @outcome.save
        redirect_to user_path current_user.id
      else
        flash.now[:danger] = "支出の登録に失敗しました。"
        render "/main/outcome"
      end

    end

  end

  private

    def set_incomeseries
      @series = InputType.all
    end

    def set_outcome_series
      @out_series = OutputType.all
    end


end
