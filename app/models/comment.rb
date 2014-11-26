class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable

  def username
    user.username
  end

  def self.by_most_recent
    order(created_at: :desc)
  end
end
