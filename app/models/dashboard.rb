class Dashboard
  attr_reader :posts

  def initialize(posts = Post.all)
    @posts = posts
  end
end
