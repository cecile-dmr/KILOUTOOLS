class ChangeLocalisationByAddressToTools < ActiveRecord::Migration[7.1]
  def change
    rename_column :tools, :localisation, :address
  end
end
