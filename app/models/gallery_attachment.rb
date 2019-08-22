class GalleryAttachment < ApplicationRecord
  belongs_to :user
  belongs_to :gallery

  mount_uploader :picture, PicturesUploader
end
