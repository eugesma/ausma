class CreateExtensionActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :extension_activities do |t|
      t.decimal :preparation, precision: 9, scale: 2, default: 0
      t.decimal :implementation, precision: 9, scale: 2, default: 0
      t.decimal :evaluation, precision: 9, scale: 2, default: 0
      t.decimal :credit, precision: 9, scale: 2, default: 0
      t.text :observation
      t.string :name

      t.timestamps
    end
  end
end
