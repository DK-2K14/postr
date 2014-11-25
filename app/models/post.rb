class Post < ActiveRecord::Base
  has_many :votes
  has_many :comments
  belongs_to :content, polymorphic: true
  belongs_to :user

  validates :content_id, presence: true

  def username
    user.username
  end

  def self.by_most_recent
    order(created_at: :desc)
  end

  def up_votes
    votes.where(up: true).count
  end

  def down_votes
    votes.where(up: false).count
  end

  def total_votes
    up_votes - down_votes
  end
end
