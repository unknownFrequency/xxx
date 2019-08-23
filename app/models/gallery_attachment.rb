class GalleryAttachment < ApplicationRecord
  belongs_to :user
  belongs_to :gallery
  mount_uploader :picture, PicturesUploader

  validates :user_id, presence: true
  validates :picture, presence: true
end
