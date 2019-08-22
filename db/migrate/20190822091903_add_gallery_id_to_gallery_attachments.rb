class AddGalleryIdToGalleryAttachments < ActiveRecord::Migration[5.0]
  def change
    add_reference :gallery_attachments, :gallery, foreign_key: true
  end
end
