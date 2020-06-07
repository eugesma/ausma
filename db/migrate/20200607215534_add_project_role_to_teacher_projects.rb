class AddProjectRoleToTeacherProjects < ActiveRecord::Migration[5.2]
  def change
    add_reference :teacher_projects, :project_role, index: true, default: 1
    remove_column :teacher_projects, :role
  end
end
