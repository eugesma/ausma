class CreateFormations < ActiveRecord::Migration[5.2]
  def change
    create_table :formations do |t|
      t.string :name
      t.references :formation_type, foreign_key: true
      t.decimal :hours, precision: 9, scale: 2, default: 0
      t.text :observation

      t.timestamps
    end
  end
end
