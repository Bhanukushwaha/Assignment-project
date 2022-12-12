class AddColamnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :end_date, :datetime
  end
end
  