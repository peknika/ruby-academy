class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :image, presence: true
  default_scope -> { order(created_at: :desc) }

  def thumbnail
    image.variant(combine_options: { resize: '500x500^', extent: '500x500', gravity: 'Center' })
  end
end
