class HomeController < ApplicationController
  before_action :for_top, only: [:top]

  def top
  end

  def about
  end

private
  def for_top

    if logged_in?
      render "/main/top"
    end
  end

end
