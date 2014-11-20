class TextPost < ActiveRecord::Base
  has_one :post, as: :content
  delegate :comments, to: :post

  validates :title, presence: true
  validates :text, presence: true
end
