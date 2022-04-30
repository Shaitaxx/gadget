class Article < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :title, :text, :image, :price
  end
end
