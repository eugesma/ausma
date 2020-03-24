class CreateDedications < ActiveRecord::Migration[5.2]
  def change
    create_table :dedications do |t|
      t.string :name
      t.decimal :hours, precision: 9, scale: 2, default: 0

      t.timestamps
    end
  end
end
