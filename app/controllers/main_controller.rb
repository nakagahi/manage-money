class MainController < ApplicationController

  before_action :set_incomeseries, only: [:income, :save]
  before_action :set_outcome_series, only: [:income, :outcome, :save]

  def top

    @blogs = []

    bls = Blog.where(user_id: current_user)


    if !bls.nil?

      bls.each do |bl|

        @blogs.push(bl)

      end



    end


  end

  def income

  end

  def outcome

  end

  def save

    if !params[:out]
      @income = Income.new(money: params[:money], user_id: current_user.id, month: params["start_time(2i)"], series: params[:series])

      time = "#{params["start_time(1i)"]}-#{params["start_time(2i)"]}-#{params["start_time(3i)"]} #{params["start_time(4i)"]}:#{params["start_time(5i)"]}"

      blog = Blog.new(title: params[:title], content: params[:content], start_time: time, user_id: current_user.id)

      if @income.valid? && blog.valid?
        flash[:success] = "収入の登録が完了しました。"
        @income.save
        blog.save
        redirect_to main_path
      else
        flash.now[:danger] = "収入の登録に失敗しました。"
        render "/main/income"
      end

    else
      @outcome = Output.new(money: params[:money], user_id: current_user.id, month: params[:month], series: params[:series])

      if @outcome.valid?
        flash[:success] = "支出の登録が完了しました。"
        @outcome.save
        redirect_to main_path
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
