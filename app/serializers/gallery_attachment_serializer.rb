class GalleryAttachmentSerializer < ActiveModel::Serializer
  attributes :id, :picture
  has_one :user
end
