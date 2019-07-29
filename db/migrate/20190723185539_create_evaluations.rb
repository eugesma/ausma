class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|
      t.references :teacher, foreign_key: true
      t.references :user, foreign_key: true
      t.decimal :credit, precision: 9, scale: 2, default: 0

      t.timestamps
    end
  end
end
