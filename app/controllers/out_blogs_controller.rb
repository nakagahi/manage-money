class OutBlogsController < ApplicationController
  def update
    @blog = OutBlog.find(params[:id])

    if @blog.update(blog_params)

      flash[:success] = "編集しました"

      redirect_to main_path

    else

      render 'edit'

    end
  end

  def blog_params

    params.require(:out_blog).permit(:title, :content, :start_time)

  end
end
