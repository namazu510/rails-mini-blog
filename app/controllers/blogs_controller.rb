class BlogsController < ApplicationController
  before_action :set_blog, only: [:show,:like,:comment]

  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = Blog.all
    @blog = Blog.new
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    @replys = @blog.replies
    @reply = Reply.new
  end

  # POST /blogs
  # POST /blogs.json
  def create
    Blog.new(blog_params).save
    redirect_to :action => 'index'
  end

  #POST /blogs/like
  def like
    @blog.like += 1
    @blog.save

    redirect_to :action => 'index'
  end

  #POST /blogs/:id/comment
  def comment
    @blog.replies.create(comment: params[:comment])
    redirect_to :action => 'show'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:body, :like)
    end
end
