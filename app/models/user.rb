class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  has_many :posts
  has_many :comments
  has_many :votes

  def upvote(post)
    vote = votes.find_or_create_by(post: post)
    vote.up = true
    vote.save
  end

  def downvote(post)
    vote = votes.find_or_create_by(post: post)
    vote.up = false
    vote.save
  end

  def owns?(record)
    self.id == record.user.id
  end
end
