class LinkPost < ActiveRecord::Base
  has_one :post, as: :content, dependent: :destroy
  delegate :comments, to: :post

  validates :url, presence: true
end
