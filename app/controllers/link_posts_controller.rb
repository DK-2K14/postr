class LinkPostsController < ApplicationController
  def new
    @link_post = LinkPost.new
  end

  def create
    link_post = LinkPost.new(link_post_params)

    if link_post.save
      current_user.posts.create(content: link_post)
      redirect_to link_post_path(link_post)
    else
      redirect_to :back
    end
  end

  def show
    @link_post = LinkPost.find(params[:id])
    @comment = Comment.new
  end

  private

  def link_post_params
    params.require(:link_post).permit(:url)
  end
end
