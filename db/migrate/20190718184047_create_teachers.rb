class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.references :profile, foreign_key: true
      t.references :user, foreign_key: true
      t.string :employee_num
      t.decimal :credit, precision: 9, scale: 2

      t.timestamps
    end
  end
end
