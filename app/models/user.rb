class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  has_one_attached :avatar
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",
                                   foreign_key: "followed_id",
                                   dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def feed
    following_ids = "SELECT followed_id FROM relationships WHERE follower_id=:user_id"
    Post.where("user_id IN (#{following_ids}) OR user_id=:user_id", user_id: current_user.id)
  end


  def follow(some_user)
    following << some_user
  end

  def unfollow(certain_user)
    following.delete(certain_user)
  end

  def following?(certain_user)
    following.include?(certain_user)
  end

  def likes?(post)
    Like.exists?(user_id: id, post_id: post.id)
  end
end
