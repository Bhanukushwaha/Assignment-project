class RenameCountryIdToCompanyId < ActiveRecord::Migration[6.0]
  def change
    rename_column :places, :country_id, :company_id
  end
end
