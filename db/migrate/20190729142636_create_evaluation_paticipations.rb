class CreateEvaluationPaticipations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluation_paticipations do |t|
      t.references :evaluation, foreign_key: true
      t.references :participation, foreign_key: true
      t.decimal :preparation, precision: 9, scale: 2, default: 0
      t.decimal :meeting, precision: 9, scale: 2, default: 0
      t.decimal :credit, precision: 9, scale: 2, default: 0
      t.decimal :total_credit, precision: 9, scale: 2, default: 0

      t.timestamps
    end
  end
end
