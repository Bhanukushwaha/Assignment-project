class RenameColumnToProfiles < ActiveRecord::Migration[6.0]
  def change
    rename_column :profiles, :image_id, :imagable_id
    rename_column :profiles, :image_type, :imagable_type
  end
end
