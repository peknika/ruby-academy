class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy
  # validates :post_id, presence: true
  # validates :image, presence: true

  def thumbnail
    image.variant(resize: "300x300!")
  end
end
