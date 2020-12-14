class Post < ApplicationRecord
  belongs_to :user

  validates :content, presesce: true, unless: :image?

  mount_uploader :image, imageUploader
end
