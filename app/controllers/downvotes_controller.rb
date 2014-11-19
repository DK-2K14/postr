class DownvotesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    current_user.downvote(post)
    redirect_to :back
  end
end
