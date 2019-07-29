class CreateGovernments < ActiveRecord::Migration[5.2]
  def change
    create_table :governments do |t|
      t.string :name
      t.decimal :preparation, precision: 9, scale: 2, default: 0
      t.decimal :meeting, precision: 9, scale: 2, default: 0
      t.decimal :credit, precision: 9, scale: 2, default: 0

      t.timestamps
    end
  end
end
