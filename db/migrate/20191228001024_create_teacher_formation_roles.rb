class CreateTeacherFormationRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :teacher_formation_roles do |t|
      t.string :name
      t.decimal :plus_percentage

      t.timestamps
    end
    TeacherFormationRole.create(name: "Asistente", plus_percentage: 0)
    TeacherFormationRole.create(name: "Asistente y aprobado", plus_percentage: 50)
    TeacherFormationRole.create(name: "Expositor", plus_percentage: 50)
    TeacherFormationRole.create(name: "Organizador", plus_percentage: 100)
    TeacherFormationRole.create(name: "Evaluador", plus_percentage: 50)
  end
end