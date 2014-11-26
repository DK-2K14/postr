class CommentsController < ApplicationController
  before_action :require_login

  def new
    @comment = Comment.find(params[:comment_id])
  end

  def create
    @commentable = find_commentable
    @comment = @commentable.comments.build(comment_params)

    if @comment.save
      redirect_to root_path
    else
      render :back
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user: current_user)
  end

  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value) unless name == "user_id"
      end
    end
  end
end
