class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  acts_as_taggable

  validates :image, presence: true
end
