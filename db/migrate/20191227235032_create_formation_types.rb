class CreateFormationTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :formation_types do |t|
      t.string :name
      t.decimal :credit

      t.timestamps
    end
    FormationType.create(name: "Curso")
    FormationType.create(name: "Taller")
    FormationType.create(name: "Seminario")
    FormationType.create(name: "Conferencia")
    FormationType.create(name: "Simposio")
  end
end
