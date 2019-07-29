class CreateTeacherFormations < ActiveRecord::Migration[5.2]
  def change
    create_table :teacher_formations do |t|
      t.string :name
      t.decimal :credit, precision: 9, scale: 2, default: 0

      t.timestamps
    end
  end
end
