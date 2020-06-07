class AddTotalCreditToTeacherProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :teacher_projects, :total_credit, :decimal, precision: 9, scale: 2, default: 0
  end
end
