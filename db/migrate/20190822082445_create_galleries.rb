class CreateGalleries < ActiveRecord::Migration[5.0]
  def change
    drop_table(:galleries, if_exists: true)

    create_table :galleries do |t|
      t.string :picture

      t.timestamps
    end
  end
end
