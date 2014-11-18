class Comment < ActiveRecord::Base
  belongs_to :image
  belongs_to :user

  def username
    user.username
  end
end
