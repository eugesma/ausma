class AddHoursToTeacherProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :teacher_projects, :week_hours, :decimal
  end
end
