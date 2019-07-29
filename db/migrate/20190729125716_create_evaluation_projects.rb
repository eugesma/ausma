class CreateEvaluationProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluation_projects do |t|
      t.references :evaluation, foreign_key: true
      t.references :project, foreign_key: true
      t.decimal :credit, precision: 9, scale: 2, default: 0
      t.decimal :total_credit, precision: 9, scale: 2, default: 0

      t.timestamps
    end
  end
end
