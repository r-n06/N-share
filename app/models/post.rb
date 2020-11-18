class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user, optional: true
  has_many :post_tags
  has_many :tags, through: :post_tags
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user

  with_options presence: true do
    validates :name
    validates :text
    validates :image
  end
end
