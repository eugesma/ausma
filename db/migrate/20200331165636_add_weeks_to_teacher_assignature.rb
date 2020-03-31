class AddWeeksToTeacherAssignature < ActiveRecord::Migration[5.2]
  def change
    add_column :teacher_assignatures, :weeks, :integer
  end
end
