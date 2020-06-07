class CreateProjectRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :project_roles do |t|
      t.string :name
      t.integer :percent, default: 0

      t.timestamps
    end
    ProjectRole.create(name: "Integrante")
    ProjectRole.create(name: "Colaborador")
    ProjectRole.create(name: "Co-Director")
    ProjectRole.create(name: "Director")
  end
end
