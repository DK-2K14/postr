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

  def comment_params
    params.require(:comment).permit(:content).merge(user: current_user)
  end
end
