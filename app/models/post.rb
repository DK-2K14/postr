class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :votes

  def username
    user.username
  end

  def self.by_most_recent
    order(created_at: :desc)
  end
end
