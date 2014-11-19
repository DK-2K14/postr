class CommentsController < ApplicationController
  before_action :require_login

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)

    if @comment.save
      redirect_to @post
    else
      render "posts/show"
    end
  end

  private

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to comment!"
      redirect_to :back
    end
  end

  def comment_params
    params.require(:comment).permit(:content).merge(user: current_user)
  end
end
