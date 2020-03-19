class RenameTeacherDedicationsToTeacherMeetings < ActiveRecord::Migration[5.2]
  def change
    rename_table :teacher_dedications, :teacher_meetings
  end
end
