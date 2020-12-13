class CreateFlows < ActiveRecord::Migration[5.2]
  def change
    create_table :flows do |t|
      t.integer :prototype_id
      t.integer :processing_id
      t.datetime :scheduled_starting_time
      t.datetime :scheduled_ending_time
      t.datetime :ending_time

      t.timestamps
    end
  end
end
