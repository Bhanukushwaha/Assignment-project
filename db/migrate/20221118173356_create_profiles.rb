class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :image
      t.integer :image_id
      t.string :image_type

      t.timestamps
    end
  end
end
