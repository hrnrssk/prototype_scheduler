class ChangeColumnToNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :flows, :number, true
  end
end
