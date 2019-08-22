class CreateGalleryAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :gallery_attachments do |t|
      t.references :user, foreign_key: true
      t.string :picture

      t.timestamps
    end
  end
end
