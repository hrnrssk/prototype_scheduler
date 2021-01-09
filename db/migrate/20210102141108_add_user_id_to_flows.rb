class AddUserIdToFlows < ActiveRecord::Migration[5.2]
  def change
    add_reference :flows, :user, foreign_key: true
  end
end
