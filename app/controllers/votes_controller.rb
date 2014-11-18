class VotesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @vote = @post.votes.new(vote_params)

    if @vote.save
      redirect_to :back
    else

    end
  end

  def destroy

  end

  def vote_params
    params.require(:vote).permit(:up).merge(user: current_user)
  end
end
