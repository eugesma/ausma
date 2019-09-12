class CreateTeacherAssignatures < ActiveRecord::Migration[5.2]
  def change
    create_table :teacher_assignatures do |t|
      t.references :teacher, foreign_key: true
      t.references :assignature, foreign_key: true
      t.integer :duration, default: 0
      t.decimal :total_credit, precision: 9, scale: 2, default: 0

      t.timestamps
    end
  end
end
