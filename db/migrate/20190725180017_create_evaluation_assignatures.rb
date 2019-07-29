class CreateEvaluationAssignatures < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluation_assignatures do |t|
      t.references :evaluation, foreign_key: true
      t.references :assignature, foreign_key: true
      t.decimal :preparation, precision: 9, scale: 2, default: 0
      t.decimal :implementation, precision: 9, scale: 2, default: 0
      t.decimal :consultation, precision: 9, scale: 2, default: 0
      t.decimal :total_credit, precision: 9, scale: 2, default: 0
      t.decimal :quantity

      t.timestamps
    end
  end
end
