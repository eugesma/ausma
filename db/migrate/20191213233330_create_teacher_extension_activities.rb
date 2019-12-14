class CreateTeacherExtensionActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :teacher_extension_activities do |t|
      t.references :teacher, foreign_key: true
      t.references :extension_activity, foreign_key: true
      t.integer :duration, default: 0
      t.decimal :total_credit, precision: 9, scale: 0, default: 0
      t.decimal :preparation, precision: 9, scale: 2, default: 0
      t.decimal :implementation, precision: 9, scale: 2, default: 0
      t.decimal :evaluation, precision: 9, scale: 2, default: 0

      t.timestamps
    end
  end
end
