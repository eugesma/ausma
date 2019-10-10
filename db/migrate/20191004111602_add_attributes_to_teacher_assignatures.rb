class AddAttributesToTeacherAssignatures < ActiveRecord::Migration[5.2]
  def change
    add_column :teacher_assignatures, :preparation, :decimal, precision: 9, scale: 2, default: 0
    add_column :teacher_assignatures, :implementation, :decimal, precision: 9, scale: 2, default: 0
    add_column :teacher_assignatures, :consultation, :decimal, precision: 9, scale: 2, default: 0
  end
end
