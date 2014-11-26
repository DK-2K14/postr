class LinkPostsController < ApplicationController
  before_filter :require_owner, only: [:edit, :update, :destroy]

  def new
    @link_post = LinkPost.new
  end

  def create
    link_post = LinkPost.new(link_post_params)
    unless link_post.title
      link_post.title = link_post.url
    end

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

  def edit
    @link_post = LinkPost.find(params[:id])
  end

  def update
    @link_post = LinkPost.find(params[:id])
    if @link_post.update(link_post_params)
      redirect_to link_post_path(@link_post)
    else
      render :edit
    end
  end

  def destroy
    link_post = LinkPost.find(params[:id])
    link_post.destroy

    redirect_to root_path
  end

  private

  def link_post_params
    params.require(:link_post).permit(:title, :url)
  end

  def require_owner
    if current_user != LinkPost.find(params[:id]).post.user
      redirect_to root_path
    end
  end
end
