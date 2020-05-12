class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :image, presence: true
  default_scope -> { order(created_at: :desc) }

  def thumbnail
    image.variant(resize: "300x300!")
  end
end
