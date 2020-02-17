class AddRoleToTeacherProject < ActiveRecord::Migration[5.2]
  def change
    add_column :teacher_projects, :role, :integer, default: 0
  end
end
