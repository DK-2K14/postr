class DashboardsController < ApplicationController
  def show
    @posts = Post.by_most_recent
  end
end
