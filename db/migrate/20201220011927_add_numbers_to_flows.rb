class AddNumbersToFlows < ActiveRecord::Migration[5.2]
  def change
    add_column :flows, :number, :integer, null: false
  end
end
