class CreatePrototypes < ActiveRecord::Migration[5.2]
  def change
    create_table :prototypes do |t|
      t.string :oder_number, null: false
      t.string :customer, null: false
      t.string :name, null: false
      t.date :delivery_date, null: false

      t.timestamps
    end
  end
end
