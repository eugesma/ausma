class CreateExtensionActivityTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :extension_activity_types do |t|
      t.string :name
      t.integer :preparation_calc, default: 0
      t.decimal :preparation, precision: 9, scale: 2
      t.decimal :evaluation, precision: 9, scale: 2


      t.timestamps
    end
  end
end
