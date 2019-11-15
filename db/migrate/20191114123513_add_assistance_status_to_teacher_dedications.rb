class AddAssistanceStatusToTeacherDedications < ActiveRecord::Migration[5.2]
  def change
    add_reference :teacher_dedications, :assistance_status, foreign_key: true
  end
end
