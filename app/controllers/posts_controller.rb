class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    post = current_user.posts.build(post_params)

    if post.save
      redirect_to post_path(post)
    else
      redirect_to :back
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
