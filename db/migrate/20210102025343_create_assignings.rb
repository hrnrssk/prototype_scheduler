class CreateAssignings < ActiveRecord::Migration[5.2]
  def change
    create_table :assignings do |t|
      t.integer :flow_id
      t.integer :user_id

      t.timestamps
    end
  end
end
