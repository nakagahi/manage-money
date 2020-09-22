class BlogsController < ApplicationController

  def index
    @blogs = Blog.all
  end

  def create

    blog = Blog.create(blog_params)

    blog.user_id = current_user.id

    blog.save

    redirect_to main_path

  end

  def new
    @blog = Blog.new
  end

  def edit
    if params[:out]
      @blog = OutBlog.find(params[:id])
      
    else
      @blog = Blog.find(params[:id])
    end
    
  end

  def show



    if params[:out].nil?
      @blog = Blog.find(params[:id])
      @incomes = Income.find_by(user_id: @blog.user_id)

    else
      @blog = OutBlog.find(params[:id])
    end

  end

  def update
    @blog = Blog.find(params[:id])

    if @blog.update(blog_params)

      flash[:success] = "編集しました"

      redirect_to main_path

    else

      render 'edit'

    end

  end

  def destroy

    if params[:out]

      @blog = OutBlog.find(params[:id])

    else
      @blog = Blog.find(params[:id])
    end

    if @blog

      flash[:danger] = "削除しました"

      @blog.destroy

      redirect_to main_path

    end

  end


  private

  def blog_params

    params.require(:blog).permit(:title, :content, :start_time)

  end
end
