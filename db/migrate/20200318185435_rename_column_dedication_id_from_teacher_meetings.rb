class RenameColumnDedicationIdFromTeacherMeetings < ActiveRecord::Migration[5.2]
  def change
    rename_column :teacher_meetings, :dedication_id, :meeting_id
  end
end
