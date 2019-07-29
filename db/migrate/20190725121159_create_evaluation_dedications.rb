class CreateEvaluationDedications < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluation_dedications do |t|
      t.references :evaluation, foreign_key: true
      t.references :dedication, foreign_key: true
      t.decimal :total_credit, precision: 9, scale: 2, default: 0
      t.integer :quantity

      t.timestamps
    end
  end
end
