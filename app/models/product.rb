class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :likes, dependent: :destroy
  acts_as_taggable

  validates :image, presence: true

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
end
