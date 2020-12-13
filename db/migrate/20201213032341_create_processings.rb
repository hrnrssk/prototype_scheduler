class CreateProcessings < ActiveRecord::Migration[5.2]
  def change
    create_table :processings do |t|
      t.string :name, null: false
      t.text :comment
      t.time :time_required, null: false
      t.references :equipment, foreign_key: true

      t.timestamps
    end
  end
end
