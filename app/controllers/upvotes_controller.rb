class UpvotesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    current_user.upvote(post)
    redirect_to :back
  end
end
