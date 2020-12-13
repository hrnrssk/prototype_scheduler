class RenameOdernumberColumnToPrototypes < ActiveRecord::Migration[5.2]
  def change
    rename_column :prototypes, :oder_number, :order_number
  end
end
