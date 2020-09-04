class BlogsController < ApplicationController

  def index
    @blogs = Blog.all
  end

  def create

    Blog.create(blog_params)

    redirect_to blogs_path

  end

  def new
    @blog = Blog.new
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])

    if @blog.update(blog_params)

      flash[:danger] = "編集しました"

      redirect_to blogs_path

    else

      render 'edit'

    end

  end

  def destroy

    @blog = Blog.find(params[:id])

    if @blog

      flash[:danger] = "削除しました"

      @blog.destroy

      redirect_to blogs_path

    end

  end

  def border
    @chart = {国語: 10, 算数: 20, 理科: 30, 社会: 40}
  end

  private

  def blog_params

    params.require(:blog).permit(:title, :content, :start_time)

  end
end
