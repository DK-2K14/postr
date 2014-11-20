class TextPostsController < ApplicationController
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

  private

  def text_post_params
    params.require(:text_post).permit(:title, :text)
  end
end
