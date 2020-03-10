class CreateTeacherMonthPresences < ActiveRecord::Migration[5.2]
  def change
    create_table :teacher_month_presences do |t|
      t.references :teacher, foreign_key: true
      t.references :month_presence, foreign_key: true
      t.decimal :presence_time, precision: 9, scale: 2

      t.timestamps
    end
  end
end
