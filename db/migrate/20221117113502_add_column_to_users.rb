class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :company_id, :integer
    add_column :users, :start_date, :datetimend_date
    add_column :users, :role_id, :integer
    add_column :users, :notes, :text
    add_column :users, :image_id, :integer
    add_column :users, :monthly_charge, :float
    add_column :users, :active, :boolean
  end
end
