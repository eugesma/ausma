class CreateProjectTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :project_types do |t|
      t.string :name

      t.timestamps
    end
    ProjectType.create(name: "Extensión")
    ProjectType.create(name: "Investigación")
  end
end
