class CreateWorkings < ActiveRecord::Migration[5.2]
  def change
    create_table :workings do |t|
      t.integer :user_id
      t.integer :processing_id

      t.timestamps
    end
  end
end
