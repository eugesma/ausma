class AddAttributesToTeacherDedications < ActiveRecord::Migration[5.2]
  def change
    add_column :teacher_dedications, :assist, :boolean
    add_column :teacher_dedications, :not_assist, :boolean
    add_column :teacher_dedications, :not_assist_without, :boolean
  end
end
