class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :name
    validates :text
    validates :image
  end
end
