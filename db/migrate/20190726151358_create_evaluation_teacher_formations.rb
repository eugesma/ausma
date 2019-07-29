class CreateEvaluationTeacherFormations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluation_teacher_formations do |t|
      t.references :evaluation, foreign_key: true
      t.references :teacher_formation, foreign_key: true
      t.decimal :quantity, precision: 9, scale: 2, default: 0
      t.decimal :total_credit, precision: 9, scale: 2, default: 0

      t.timestamps
    end
  end
end
