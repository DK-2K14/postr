class VotesController < ApplicationController
  def create
    @vote = Vote.new(vote_params)

    if @vote.save
      redirect_to :back
    else

    end
  end

  def updated

  end

  def destroy

  end

  def vote_params
    params.require(:vote).permit(:up, :post_id).merge(user: current_user)
  end
end
