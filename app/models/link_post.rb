class LinkPost < ActiveRecord::Base
  has_one :post, as: :content
  delegate :comments, to: :post

  validates :url, presence: true
end
