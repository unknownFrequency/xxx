class AddTitleToGallery < ActiveRecord::Migration[5.0]
  def change
    add_column :galleries, :title, :string
  end
end
