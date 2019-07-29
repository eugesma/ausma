class CreateAssignatures < ActiveRecord::Migration[5.2]
  def change
    create_table :assignatures do |t|
      t.decimal :preparation, :decimal, precision: 9, scale: 2, default: 0
      t.decimal :implementation, :decimal, precision: 9, scale: 2, default: 0
      t.decimal :consultation, :decimal, precision: 9, scale: 2, default: 0
      t.decimal :credit, :decimal, precision: 9, scale: 2, default: 0
      t.text :observation
      t.string :name

      t.timestamps
    end
  end
end
