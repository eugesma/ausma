class CreateTeacherDedications < ActiveRecord::Migration[5.2]
  def change
    create_table :teacher_dedications do |t|
      t.references :teacher, foreign_key: true
      t.references :dedication, foreign_key: true
      t.integer :quantity, default: 1
      t.decimal :total_credit, precision: 9, scale: 2, default: 0

      t.timestamps
    end
  end
end
