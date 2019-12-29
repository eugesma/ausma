class ChangeAttributesToTeacherFormation < ActiveRecord::Migration[5.2]
  def change
    add_reference :teacher_formations, :teacher, foreign_key: true
    add_reference :teacher_formations, :formation, foreign_key: true
    add_reference :teacher_formations, :teacher_formation_role, foreign_key: true

    remove_column :teacher_formations, :name
    remove_column :teacher_formations, :credit
  end
end
