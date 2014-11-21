class TextPostsController < ApplicationController
  before_filter :require_owner, only: :edit

  def new
    @text_post = TextPost.new
  end

  def create
    text_post = TextPost.new(text_post_params)

    if text_post.save
      current_user.posts.create(content: text_post)
      redirect_to text_post_path(text_post)
    else
      redirect_to :back
    end
  end

  def show
    @text_post = TextPost.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @text_post = TextPost.find(params[:id])
  end

  def update
    @text_post = TextPost.find(params[:id])
    if @text_post.update(text_post_params)
      redirect_to text_post_path(@text_post)
    else
      render :edit
    end
  end

  def destroy
    text_post = TextPost.find(params[:id])
    text_post.destroy

    redirect_to root_path
  end

  private

  def text_post_params
    params.require(:text_post).permit(:title, :text)
  end

  def require_owner
    if current_user != TextPost.find(params[:id]).post.user
      redirect_to root_path
    end
  end
end
