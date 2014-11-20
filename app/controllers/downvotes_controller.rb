class DownvotesController < ApplicationController
  before_action :require_login

  def create
    post = Post.find(params[:post_id])
    current_user.downvote(post)
    redirect_to :back
  end

end
