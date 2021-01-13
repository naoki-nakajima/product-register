class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :likes, dependent: :destroy
  acts_as_taggable

  validates :image, presence: true
end
