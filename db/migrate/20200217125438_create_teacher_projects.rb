class CreateTeacherProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :teacher_projects do |t|
      t.references :teacher, foreign_key: true
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
