class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user, optional: true

  with_options presence: true do
    validates :name
    validates :text
    validates :image
  end
end
