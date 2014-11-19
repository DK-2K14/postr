class UpvotesController < ApplicationController
  before_action :require_login

  def create
    post = Post.find(params[:post_id])
    current_user.upvote(post)
    redirect_to :back
  end

  private

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to vote!"
      redirect_to :back
    end
  end
end
